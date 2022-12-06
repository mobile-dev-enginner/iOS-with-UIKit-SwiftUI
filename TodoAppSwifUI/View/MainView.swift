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
            Text("Discover")
                .tabItem {
                    Label(
                        NSLocalizedString("Discover", comment: "Discover tab label"),
                        systemImage: "person.icloud")
                }.tag(1)
            // The About - Info tab
            Text("About")
                .tabItem {
                    Label(
                        NSLocalizedString("About", comment: "About tab label"),
                        systemImage: "wand.and.rays")
                }.tag(2)
        }
        .accentColor(Color("NavigationBarTitle"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
