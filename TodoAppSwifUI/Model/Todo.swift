//
//  Todo.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 05/12/2022.
//

import Combine
import CoreData

enum Category: String, CaseIterable {
    case family = "family"
    case personal = "personal"
    case work = "work"
}

/// A `Todo` model
public class Todo: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var category: String
}

extension Todo: Identifiable {}
