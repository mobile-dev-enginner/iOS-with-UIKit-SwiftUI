//
//  AddItemView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 05/12/2022.
//

import SwiftUI
/// The add todo view for adding user inputs
struct AddTodoView: View {
    @Environment(\.managedObjectContext) var context
    // MARK: - BINDINGS
    @Binding var showAddTodoView: Bool
    // MARK: - STATES
    @State var name: String = "New Todo"
    @State var selectedCategory = 0
    @State var category: Category
    @State var isEditing = false
    var categoryTypes = Category.allCases


    // MARK: - SOME SORT OF VIEW
    var body: some View {
        VStack {
            Text(NSLocalizedString("Add Todo", comment: "Add Todo Label"))
                .font(.largeTitle)
            TextField(NSLocalizedString("To do name", comment: "To do name hint"), text: $name, onEditingChanged: { e in
                self.isEditing = e
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black).padding()

            Text(NSLocalizedString("Select Category", comment: "Select Category"))
            Picker("", selection: $selectedCategory) {
                ForEach(0..<categoryTypes.count) {
                    Text(categoryTypes[$0].rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()

        Button(action: {
            if self.name.trimmingCharacters(in: .whitespaces) == "" {
                return
            }
            self.showAddTodoView = false
            addTodo(name: self.name, category: self.categoryTypes[selectedCategory])
        }, label: {
            Text(NSLocalizedString("Done", comment: "Done"))
                .font(.system(.headline, design: .rounded))
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.purple)
                .cornerRadius(10)
        })
    }

    // MARK: - METHODS
    /// Insert a new record into the database
    private func addTodo(name: String , category: Category) {
        let task = Todo(context: context)
        task.id = UUID()
        task.name = name
        task.category = category.rawValue

        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

