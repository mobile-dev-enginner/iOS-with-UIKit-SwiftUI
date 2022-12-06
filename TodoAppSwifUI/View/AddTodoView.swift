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
    @State var isEditing = false
    @State var name: String = "New Todo"
    @State var selectedCategory = 0
    @State var priority: Priority
    @State var category: Category
    var categoryTypes = Category.allCases


    // MARK: - SOME SORT OF VIEW
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(NSLocalizedString("Add Todo", comment: "Add Todo Label"))
                    .font(.largeTitle)
                // INPUT TEXT
                TextField(NSLocalizedString("To do name", comment: "To do name hint"), text: $name, onEditingChanged: { e in
                    self.isEditing = e
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.black)
                    .padding()
                // CATEGORY
                Text(NSLocalizedString("Select Category", comment: "Select Category"))
                Picker("", selection: $selectedCategory) {
                    ForEach(0..<categoryTypes.count) {
                        Text(categoryTypes[$0].rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding()
            // PRIORITY
            Text(NSLocalizedString("Priority", comment: "Priority Label"))
                .font(.system(.subheadline, design: .rounded))
                .padding(.bottom)

            HStack {
                Text(NSLocalizedString("High", comment: "High"))
                    .font(.system(.headline, design: .rounded))
                    .padding(10)
                    .background(priority == .high ? Color.red : Color(.systemGray4))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        self.priority = .high
                    }

                Text(NSLocalizedString("Normal", comment: "Normal"))
                    .font(.system(.headline, design: .rounded))
                    .padding(10)
                    .background(priority == .normal ? Color.orange : Color(.systemGray4))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        self.priority = .normal
                    }

                Text(NSLocalizedString("Low", comment: "Low"))
                    .font(.system(.headline, design: .rounded))
                    .padding(10)
                    .background(priority == .low ? Color.green : Color(.systemGray4))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        self.priority = .low
                    }
            }
            .padding(.bottom, 30)
            // DONE BUTTON
            Button(action: {
                if self.name.trimmingCharacters(in: .whitespaces) == "" {
                    return
                }
                self.showAddTodoView = false
                addTodo(priority: self.priority, name: self.name, category: self.categoryTypes[selectedCategory])
            }, label: {
                Text(NSLocalizedString("Done", comment: "Done"))
                    .font(.system(.headline, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .cornerRadius(5)
            })
                .padding(.bottom)
        }
        .padding()

        Spacer()
    }

    // MARK: - METHODS
    /// Insert a new record into the database
    private func addTodo(priority: Priority, name: String , category: Category) {
        let task = Todo(context: context)
        task.id = UUID()
        task.priority = priority
        task.name = name
        task.category = category.rawValue

        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

