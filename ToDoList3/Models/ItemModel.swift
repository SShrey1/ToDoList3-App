//
//  ItemModel.swift
//  ToDoList3
//
//  Created by user@59 on 27/09/24.
//

import Foundation

// immutable struct

struct ItemModel : Identifiable, Codable {
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id : String = UUID().uuidString, title : String, isCompleted : Bool)
    {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ItemModel
    {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
