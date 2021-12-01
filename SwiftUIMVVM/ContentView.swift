//
//  ContentView.swift
//  SwiftUIMVVM
//
//  Created by Shireesh Marla on 01/12/2021.
//

import SwiftUI

struct ToDoListItem : Identifiable {
    var id = UUID()
    var action: String
}

class ToDoList : ObservableObject {
    @Published var items: [ToDoListItem] = []
}

struct ContentView: View {
    @ObservedObject var viewModel : ToDoList = ToDoList()
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.items){ item in
                    Text(item.action)
                }
            }.navigationTitle("To Do List")
            .navigationBarItems(trailing: Button(
            action: {
                self.viewModel.items = [
                    ToDoListItem(action: "Brush"),
                    ToDoListItem(action: "Do yoga"),
                    ToDoListItem(action: "Have Tea"),
                    ToDoListItem(action: "Drop Khushi @School"),
                    ToDoListItem(action: "Attend Standup"),
                ]
                                        
                },
                label: {
                    Text("Refresh")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
