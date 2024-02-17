//
//  ListViewModel.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = []
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        let newTasks = [
            TaskModel(title: "This is the first title!", isCompleted: false),
            TaskModel(title: "This is the second title!", isCompleted: true),
            TaskModel(title: "This is the third title!", isCompleted: true)
        ]
        
        tasks.append(contentsOf: newTasks)
    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func addTask(title: String) {
        let newTask = TaskModel(title: title, isCompleted: false)
        tasks.append(newTask)
    }
    
    func updateTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task.updateCompletion()
        }
    }
    
}
