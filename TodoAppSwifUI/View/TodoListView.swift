//
//  ContentView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 27/07/2021.
//

import SwiftUI
import CoreData
/// The app's main view
struct TodoListView: View {
    // MARK: - STATES, PROPERTY WRAPPER
    @Environment(\.managedObjectContext) var viewContext

    @FetchRequest(
        entity: Todo.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \Todo.category, ascending: false) ])
    var todos: FetchedResults<Todo>

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
                        })
                        {
                            TodoListRowView(todo: todo)
                                .onLongPressGesture(perform: {
                                    updateTodo(todo: todo)
                                })
                        }
                    }
                    // Deleting a Todo item
                    .onDelete(perform: deleteTodo)
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
                            showAddTodoView: $showNewTodo, name: "", priority: .normal, category: .family
                        )
                    },
            trailing: EditButton())
        }
    }
    // MARK: - METHODS
    private func updateTodo(todo: FetchedResults<Todo>.Element) {
        todo.name = "Complete 🤪"
        todo.priority = .low
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    private func deleteTodo(offsets : IndexSet) {
        for i in offsets {
            let todo = todos[i]
            viewContext.delete(todo)
        }

        DispatchQueue.main.async {
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).previewDevice("iPhone SE (2nd generation)")
    }
}
