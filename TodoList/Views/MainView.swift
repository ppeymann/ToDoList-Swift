//
//  ContentView.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var viewModel = MainViewViewModel()
        
    var body: some View {
      
        if viewModel.isSignIn, !viewModel.currentUserId.isEmpty{
            account
        }else {
            LoginView()
        }

        
    }
    
    @ViewBuilder
    var account: some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                   Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
        
}
