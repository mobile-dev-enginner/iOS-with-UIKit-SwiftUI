//
//  Todo.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 05/12/2022.
//

import Combine
import CoreData

enum Priority: Int {
    case low = 0
    case normal = 1
    case high = 2
}

enum Category: String, CaseIterable {
    case family = "family"
    case personal = "personal"
    case work = "work"
}

/// A `Todo` model
public class Todo: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var priorityNum: Int32
    @NSManaged public var name: String
    @NSManaged public var category: String
}

extension Todo: Identifiable {
    var priority: Priority {
        get {
            return Priority(rawValue: Int(priorityNum)) ?? .normal
        }
        set {
            self.priorityNum = Int32(newValue.rawValue)
        }
    }
}
