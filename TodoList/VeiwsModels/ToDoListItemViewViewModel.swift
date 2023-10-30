//
//  ToDoListItemViewViewModel.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ToDoListItemViewViewModel: ObservableObject {
    
    
    
    init(){}
    
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!newItem.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("user")
            .document(uid)
            .collection("todo")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
