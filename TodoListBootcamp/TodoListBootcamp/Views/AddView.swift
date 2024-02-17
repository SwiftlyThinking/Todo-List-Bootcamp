//
//  AddView.swift
//  TodoListBootcamp
//
//  Created by Mykyta Kuzminov on 17.02.2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ListViewModel
    
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                textField
                saveButton
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK") {}
        }
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}

extension AddView {
    
    private var textField: some View {
        TextField("Type something here...", text: $textFieldText)
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 10))
    }
    
    private var saveButton: some View {
        Button {
            saveButtonPressed()
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
    
    private func saveButtonPressed() {
        if textIsAppropriate() {
            vm.addTask(title: textFieldText)
            dismiss()
        }
    }
    
    private func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo task must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
}
