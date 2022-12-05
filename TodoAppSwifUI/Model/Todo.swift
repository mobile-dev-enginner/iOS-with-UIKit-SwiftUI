//
//  Todo.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 05/12/2022.
//

import Foundation
import Combine

/// A `Todo` model
class Todo: Identifiable, ObservableObject {
    let id = UUID()

    @Published var name: String = ""
    @Published var category: String = ""

    init(name: String, category: String) {
        self.name = name
        self.category = category
    }
}
