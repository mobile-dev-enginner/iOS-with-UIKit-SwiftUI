//
//  MainView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 06/12/2022.
//

import SwiftUI

struct MainView: View {
    // MARK: - STATE VARIABLES
    @State private var selectedTabIndex = 0

    // MARK: - SOME SORT OF VIEW
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            // The to-do list tab
            TodoListView()
                .tabItem {
                    Label(
                        NSLocalizedString("Todo Lists", comment: "Todo Lists tab label"),
                        systemImage: "checklist")
                }.tag(0)
            // The Github's Users discover list tab
            GithubUsersListView()
                .tabItem {
                    Label(
                        NSLocalizedString("Discover", comment: "Discover tab label"),
                        systemImage: "person.icloud")
                }.tag(1)
            // The Favorites list tab
            FavoritesListView()
                .tabItem {
                    Label(
                        NSLocalizedString("Favorites", comment: "Favorites tab label"),
                        systemImage: "star.square.fill")
                }.tag(2)
            // The About - Info tab
            Text("About")
                .tabItem {
                    Label(
                        NSLocalizedString("About", comment: "About tab label"),
                        systemImage: "wand.and.rays")
                }.tag(3)
        }
        .accentColor(Color("NavigationBarTitle"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
