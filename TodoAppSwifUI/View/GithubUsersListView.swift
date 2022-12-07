//
//  GithubUsersListView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 06/12/2022.
//

import SwiftUI
import URLImage

struct GithubUsersListView: View {
    // MARK: - PROPERTY WRAPPER
    @ObservedObject private var githubUserViewModel: GithubUserViewModel

    // MARK: - STATE VARIABLES
    @State private var searchText = "DevOpsThinh"

    // MARK: - INITIALIZERS
        init() {
            let viewModel = GithubUserViewModel()
            githubUserViewModel = viewModel
        }

    // MARK: - SOME SORT OF VIEW
    var body: some View {
        NavigationView {
            VStack {
                // The search bar view
                SearchBar(text: $searchText)
                    .padding(.top, -10)
                Spacer()
                // If there is no data, show a loader indicator view
                if githubUserViewModel.items.count == 0 {
                    ProgressView().onAppear() {
                        githubUserViewModel.getUser(searchTerm: searchText)
                    }
                } else {
                    // The Users Filtered List
                    FilteredList($searchText)
                }

                Spacer()
            }
            .navigationTitle(NSLocalizedString("Github Users", comment: "Github Users Label"))
            .navigationBarTitleDisplayMode(.automatic)
        }
        .accentColor(Color("AccentColor"))
    }
}

struct FilteredList: View {
    @ObservedObject private var viewModel = GithubUserViewModel()

    @Binding var searchText: String

    init(_ searchText: Binding<String>) {
        self._searchText = searchText
        viewModel.getUser(searchTerm: self.searchText)
    }

    var body: some View {

        ZStack {
            // The Github users list
            List(viewModel.items, id: \.login) { user in
                Link(destination: URL(string: user.html_url)!) {
                    HStack (alignment: .top) {
                        URLImage(URL(string: user.avatar_url)!) { image in
                            image.resizable().frame(width: 60, height: 60)
                        }

                        VStack(alignment: .leading) {
                            Text(user.login)
                                .font(.custom("Nunito-Bold", size: 24, relativeTo: .headline))
                            Text("\(user.url)")
                                .font(.system(size: 13))
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                }
            }

            if viewModel.items.count == 0 {
                NoDataView()
            }
        }
    }
}

struct GithubUsersListView_Previews: PreviewProvider {
    static var previews: some View {
        GithubUsersListView()
    }
}
