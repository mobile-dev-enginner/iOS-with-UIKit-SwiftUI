//
//  FavoritesListView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 07/12/2022.
//

import SwiftUI
import URLImage

struct FavoritesListView: View {
    // MARK: - PROPERTY WRAPPER
    @ObservedObject var favoritesRepo: FavoritesRepository = FavoritesRepository()

    // MARK: - STATE VARIABLES
    @State var isNewFavoritePresented = false

    // MARK: - SOME SORT OF VIEW
    var body: some View {
        NavigationView {
            List {
                ForEach (favoritesRepo.users, id: \.login) { user in
                    NavigationLink(destination: FavoriteItemDetailView(
                        login: user.login,
                        url: user.url,
                        avatar_url: user.avatar_url,
                        html_url: user.html_url,
                        repository: favoritesRepo
                    )) {
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
                .onDelete(perform: deleteUser)
            }
        }
    }

    /// Delete a exist user
    private func deleteUser(offsets : IndexSet) {
        for i in offsets {
            if i == offsets.first {
                favoritesRepo.remove(at: i)
            }
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
