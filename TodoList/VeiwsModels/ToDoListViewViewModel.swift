//
//  ToDoListViewViewModel.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var show: Bool = false
    
    private var userId: String
    
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete Todo List Item
    /// - Parameter id: ToDo list ID
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("user")
            .document(userId)
            .collection("todo")
            .document(id)
            .delete()
    }
    
}
