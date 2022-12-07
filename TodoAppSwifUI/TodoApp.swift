//
//  TodoApp.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 27/07/2021.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
            FirebaseApp.configure()
            return true
        }
}

@main
struct TodoApp: App {
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    let persistenceController = PersistenceController.shared

    /// Customize the nav bar: font, color
    init() {
        let navBarAppearance = UINavigationBarAppearance()

        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        navBarAppearance.backgroundColor = .clear
        navBarAppearance.backgroundEffect = .none
        navBarAppearance.shadowColor = .clear

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }

    // MARK: - SOME SORT OF VIEW
    var body: some Scene {
        WindowGroup {
            MainView()
            // Inject the managed object context into the env of Main view
                .environment(
                    \.managedObjectContext,
                     persistenceController.container.viewContext
                )
        }
    }
}
