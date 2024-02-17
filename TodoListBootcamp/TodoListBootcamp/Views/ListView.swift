//
//  ListView.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    // destination...
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
