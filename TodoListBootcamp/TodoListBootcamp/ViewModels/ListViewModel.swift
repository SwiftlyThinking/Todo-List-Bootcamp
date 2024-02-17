//
//  ListViewModel.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        guard 
            let data = UserDefaults.standard.data(forKey: "tasks"),
            let savedItems = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        tasks.append(contentsOf: savedItems)
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: "tasks")
        }
    }
    
}
