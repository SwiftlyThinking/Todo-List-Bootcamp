//
//  ListRowView.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(title: "This is the first title!")
}
