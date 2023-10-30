//
//  LoginView.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title: "To Do List", subTitle: "Get things Done", rotate: 18, background: .orange)
                
                // LoginForm
                Form {
                    
                    if !viewModel.errorMassage.isEmpty {
                        Text(viewModel.errorMassage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TLButtonView(title: "Log In", bgColor: .green, textColor: .white){
                        viewModel.login()
                    }
                    
                        .padding()
                    
                }
                .offset(y:-50)
                
                // Create Account
                Text("New around here?")
                NavigationLink("Create An Account", destination: RegisterView())
                .padding(.bottom, 30)
                
            }
            
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
