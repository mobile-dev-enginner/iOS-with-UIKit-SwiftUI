//
//  TodoItemView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 05/12/2022.
//

import SwiftUI

struct TodoListRowView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var todo: Todo
    // MARK: - SOME SORT OF VIEW
    var body: some View {
        HStack {
            Image(todo.category)
                .resizable()
                .frame(width: 50, height: 50)
            Text(todo.name)
        }
    }
}
