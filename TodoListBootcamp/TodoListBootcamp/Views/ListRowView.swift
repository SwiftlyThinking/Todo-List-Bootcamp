//
//  ListRowView.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import SwiftUI

struct ListRowView: View {
    
    let task: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(task.isCompleted ? Color.green : Color.red)
            Text(task.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(task: TaskModel(title: "This is the first title!", isCompleted: true))
}
