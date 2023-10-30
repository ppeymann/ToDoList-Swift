//
//  NewItemView.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New TODO")
                .bold()
                .font(.system(size: 32))
                .foregroundColor(.purple)
                .padding(.top, 70)
            
            Form{
                // Title
                TextField("Enter TODO title", text:$viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Date
                DatePicker("Due Date", selection: $viewModel.DuDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    
                // Button
                TLButtonView(title: "Save", bgColor: .purple, textColor: .white){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text(
                "Please fill all field AND select time that is Today OR Newer"
                ))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {_ in }))
}
