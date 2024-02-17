//
//  AddView.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(.rect(cornerRadius: 10))
                
                Button {
                    //to do...
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
