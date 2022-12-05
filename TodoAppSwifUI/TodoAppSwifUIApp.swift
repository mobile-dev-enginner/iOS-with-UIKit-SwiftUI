//
//  TodoAppSwifUIApp.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 27/07/2021.
//

import SwiftUI

@main
struct TodoAppSwifUIApp: App {
    let persistenceController = PersistenceController.shared
    // MARK: - SOME SORT OF VIEW
    var body: some Scene {
        WindowGroup {
            TodoListView()
                .environment(
                    \.managedObjectContext,
                     persistenceController.container.viewContext
                )
        }
    }
}
