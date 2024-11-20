//
//  ListView.swift
//  ToDoList3
//
//  Created by user@59 on 27/09/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else
            {
                List
                {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear)
                                {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                       // ListRowView(title: item)
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
       
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add",destination: AddView()))
    }
   
}


#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}

