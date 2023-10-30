//
//  LoginViewViewModel.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMassage: String = ""
    
    init(){}
    
    func login (){
        guard validation() else {
            return
        }
        
        // Try to Sign In
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validation() -> Bool{
        errorMassage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty , !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMassage = "Please fill in all fields"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMassage = "Email is not valid"
            return false
        }
        
        return true
    }
}
