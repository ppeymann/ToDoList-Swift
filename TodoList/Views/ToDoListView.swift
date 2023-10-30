//
//  ToDoListView.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "/user/\(userId)/todo")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                        
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.show = true
                }label:{
                    Image(systemName: "plus")
                        .foregroundColor(.gray)
                }
            }
            .sheet(isPresented: $viewModel.show) {
                NewItemView(newItemPresented: $viewModel.show)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "7xZrEwTITEX1seZyszNNMqmrbIw2")
}
