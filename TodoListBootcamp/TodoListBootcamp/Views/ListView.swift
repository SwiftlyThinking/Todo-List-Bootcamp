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
            if vm.tasks.isEmpty {
                NoTasksView()
            } else {
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
        }
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
    .environmentObject(ListViewModel())
}
