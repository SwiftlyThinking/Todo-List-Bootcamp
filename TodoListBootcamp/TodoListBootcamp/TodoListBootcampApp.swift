//
//  TodoListBootcampApp.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import SwiftUI

@main
struct TodoListBootcampApp: App {
    
    @StateObject var vm = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(vm)
        }
    }
}
