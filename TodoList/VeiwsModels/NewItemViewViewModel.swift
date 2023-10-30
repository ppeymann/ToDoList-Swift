//
//  NewItemViewViewModel.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel:ObservableObject {
    @Published var title: String = ""
    @Published var DuDate: Date = Date()
    @Published var showAlert: Bool = false
    
    init(){}
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get Current User Id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newTodo = ToDoListItem(id: newId, title: title, duDate: DuDate.timeIntervalSince1970, createdData: Date().timeIntervalSince1970, isDone: false)
        
        // Save model
        let db = Firestore.firestore()
        
        db.collection("user")
            .document(uid)
            .collection("todo")
            .document(newId)
            .setData(newTodo.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard DuDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
