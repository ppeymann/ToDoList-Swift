//
//  ProfileView.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                }else {
                    Text("Profile is loading ... ")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user:User) -> some View{
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .foregroundColor(.green)
            .frame(width: 135, height: 135)
            .padding()
        
        // Information
        VStack(alignment: .leading){
            HStack{
                Text("Name:")
                Text(user.name)
            }
            .padding()
            HStack{
                Text("Email:")
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Joined At:")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        // Sign Out
        Button("Sign Out"){
            viewModel.logOut()
        }
        
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
