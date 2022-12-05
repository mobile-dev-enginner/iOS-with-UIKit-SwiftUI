//
//  ContentView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 27/07/2021.
//

import SwiftUI
/// The app's main view
struct TodoListView: View {
    // MARK: - STATES
    /// A state array
    @State var todos: [Todo] = []
    @State private var showNewTodo = false

    // MARK: - SOME SORT OF VIEW
    var body: some View {

        NavigationView {
            VStack {
                // If there is no data, show an empty view
                if todos.count == 0 {
                    NoDataView()
                }

                List {
                    ForEach(todos) { todo in
                        // When an item is tapped
                        NavigationLink(destination: VStack {
                            TodoItemDetailView(todo: todo)
                        }) {
                            TodoListRowView(todo: todo)
                        }
                    }
                    // Deleting a Todo item
                    .onDelete(perform: { i in
                        todos.remove(atOffsets: i)
                    })
                    // Rearranging rows
                    .onMove(perform: { (i , j) in
                        todos.move(fromOffsets: i, toOffset: j)
                    })
                    }
                .rotation3DEffect(Angle(degrees: showNewTodo ? 5 : 0), axis: (x: 1, y: 0, z: 0))
                .offset(y: showNewTodo ? -50 : 0)
                .animation(.easeOut, value: showNewTodo)
            }
            .navigationBarTitle(NSLocalizedString("Todo Items", comment: "Todo Items Label"))
            .navigationBarItems(
                leading: Button(action: {
                    self.showNewTodo.toggle()
                }, label: {
                    Text(NSLocalizedString("Add", comment: "Add"))
                })
                    .sheet(isPresented: $showNewTodo) {
                        AddTodoView(
                            showAddTodoView: self.$showNewTodo,
                            todos: self.$todos
                        )
                    },
            trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView().previewDevice("iPhone SE (2nd generation)")
    }
}
