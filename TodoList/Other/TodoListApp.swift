//
//  TodoListApp.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import SwiftUI
import SwiftData
import FirebaseCore

@main
struct TodoListApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
       
    }
}
