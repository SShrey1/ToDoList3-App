//
//  ListRowView.swift
//  ToDoList3
//
//  Created by user@59 on 27/09/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            // Change the image based on the item's completion status
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8) // Optional: Add some padding for better appearance
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        // Declare static variables for the ItemModel instances
        let item1 = ItemModel(title: "First Item!", isCompleted: false)
        let item2 = ItemModel(title: "Second Item!", isCompleted: true)

        // Return a Group containing both ListRowViews
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
