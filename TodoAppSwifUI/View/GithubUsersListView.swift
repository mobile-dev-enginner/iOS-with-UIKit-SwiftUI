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
    @ObservedObject var fetch = FetchUsers()

    // MARK: - STATE VARIABLES
    @State private var searchText = ""

    // MARK: - SOME SORT OF VIEW
    var body: some View {
        NavigationView {
            VStack {
                // The search bar
                SearchBar(text: $searchText)
                    .padding(.top, -10)
                Spacer()
                // If there is no data, show an empty view
                if fetch.items.count == 0 {
                    ProgressView().onAppear() {
                        fetch.getUser()
                    }
                } else {
                    // The Github users list
                    List(fetch.items, id: \.login) { user in
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
                }
            }
            .navigationTitle(NSLocalizedString("Github Users", comment: "Github Users Label"))
            .navigationBarTitleDisplayMode(.automatic)
        }
        .accentColor(Color("AccentColor"))
    }
}

struct GithubUsersListView_Previews: PreviewProvider {
    static var previews: some View {
        GithubUsersListView()
    }
}
