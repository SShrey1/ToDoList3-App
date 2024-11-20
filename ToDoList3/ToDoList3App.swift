//
//  ToDoList3App.swift
//  ToDoList3
//
//  Created by user@59 on 27/09/24.
//

import SwiftUI

@main
struct ToDoList3App: App {
   @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
            
        }
    }
}
