//
//  RegisterViewViewModel.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import FirebaseFirestore
import Foundation
import FirebaseAuth

class RegisterViewViewModel: ObservableObject {
    
    // States
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errMessage: String = ""
    
    
    init(){}
    
    func register() {
        guard validation() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, err in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
            

        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("user")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validation() -> Bool {
        errMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty ,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errMessage = "Please fill all field"
            return false
        }
        
        guard email.contains("@"), email.contains(".") else {
            errMessage = "email is not correct"
            return false
        }
        
        guard password.count >= 6 else {
            errMessage = "password is weak"
            return false
        }
        
        return true
    }
}
