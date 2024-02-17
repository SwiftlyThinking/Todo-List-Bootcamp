//
//  ListView.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the first title!",
        "This is the second title!",
        "This is the third title!"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { title in
                ListRowView(title: title)
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
