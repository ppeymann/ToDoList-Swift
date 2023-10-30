//
//  ToDoListItem.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import Foundation


struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let duDate: TimeInterval
    let createdData: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
