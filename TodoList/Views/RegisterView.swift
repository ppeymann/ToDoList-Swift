//
//  RegisterView.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            // Header
            HeaderView(title: "Register", subTitle: "Start Organize TODOs", rotate: -18, background: .yellow)
            
            // Form
            Form{
                Text(viewModel.errMessage)
                    .foregroundColor(.red)
                
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                TextField("Email Address", text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButtonView(title: "Register", bgColor: .indigo, textColor: .white){
                    viewModel.register()
                }
                
                .padding()
            }
            .offset(y:-50)
                Spacer()
        }
        
    }
}

#Preview {
    RegisterView()
}
