//
//  AddView.swift
//  ToDoList3
//
//  Created by user@59 on 27/09/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText : String = ""
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Something Here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray)
                .cornerRadius(10)
                
                Button(action: savebuttonPressed , label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        
        .navigationTitle("Add an item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func savebuttonPressed()
    {
        if textIsAppropriate()
        {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3
        {
            alertTitle = "Your new toDo item must be at 3 characters long!!! 😨😱😰"
            showAlert.toggle()
            return false
        }
        
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView
    {
        AddView()
    }
    .environmentObject(ListViewModel())
   
}
