//
//  ListView.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import SwiftUI

struct ListView: View {
    
    @State var tasks: [TaskModel] = [
        TaskModel(title: "This is the first title!", isCompleted: false),
        TaskModel(title: "This is the second title!", isCompleted: true),
        TaskModel(title: "This is the third title!", isCompleted: true)
    ]
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                ListRowView(task: task)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add")
                }

            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
