//
//  AddItemView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 05/12/2022.
//

import SwiftUI
/// The add todo view for adding user inputs
struct AddTodoView: View {
    // MARK: - BINDINGS
    @Binding var showAddTodoView: Bool
    @Binding var todos: [Todo]

    // MARK: - STATES
    @State private var name: String = "New Todo"
    @State private var selectedCategory = 0
    var categoryTypes = ["family", "personal", "work" ]


    // MARK: - SOME SORT OF VIEW
    var body: some View {
        VStack {
            Text(NSLocalizedString("Add Todo", comment: "Add Todo Label"))
                .font(.largeTitle)
            TextField(NSLocalizedString("To do name", comment: "To od name hint"), text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black).padding()

            Text(NSLocalizedString("Select Category", comment: "Select Category"))
            Picker("", selection: $selectedCategory) {
                ForEach(0..<categoryTypes.count) {
                    Text(self.categoryTypes[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()

        Button(action: {
            self.showAddTodoView = false
            todos.append(Todo(
                name: name,
                category: categoryTypes[selectedCategory]))
        }, label: {
            Text(NSLocalizedString("Done", comment: "Done"))
        })
    }
}

struct AddTodoView_Previews: PreviewProvider {
    @State static var showAddTodoView: Bool = true
    @State static var todos = [
        Todo(name: "Write SwiftUI App", category: "work"),
        Todo(name: "Read Bible", category: "personal")
    ]
    static var previews: some View {
        AddTodoView(showAddTodoView: self.$showAddTodoView, todos: self.$todos).previewDevice("iPhone SE (2nd generation)")
    }
}
