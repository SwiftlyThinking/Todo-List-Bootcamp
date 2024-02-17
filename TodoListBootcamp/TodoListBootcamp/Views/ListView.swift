//
//  ListView.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var vm: ListViewModel
    
    var body: some View {
        ZStack {
            if tasksIsEmpty() {
                NoTasksView()
            } else {
                tasksList
            }
        }
        .transition(.opacity)
        .animation(.easeIn, value: tasksIsEmpty())
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
                    .opacity(tasksIsEmpty() ? 0 : 1)
                    .animation(.easeIn, value: tasksIsEmpty())
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                addButton
                    .opacity(tasksIsEmpty() ? 0 : 1)
                    .animation(.easeIn, value: tasksIsEmpty())
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}

extension ListView {
    
    private var tasksList: some View {
        List {
            ForEach(vm.tasks) { task in
                ListRowView(task: task)
                    .onTapGesture {
                        withAnimation(.default) {
                            vm.updateTask(task: task)
                        }
                    }
            }
            .onDelete(perform: vm.deleteTask)
            .onMove(perform: vm.moveTask)
        }
        .listStyle(.plain)
    }
    
    private var addButton: some View {
        NavigationLink {
            AddView()
        } label: {
            Text("Add")
        }
    }
    
    private func tasksIsEmpty() -> Bool {
        return vm.tasks.isEmpty
    }
}
