//
//  FavoriteItemDetailView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 07/12/2022.
//

import SwiftUI
import URLImage

struct FavoriteItemDetailView: View {
    // MARK: - PROPERTY WRAPPER
    @Environment(\.dismiss) var dismiss

    @State var login: String = ""
    @State var url: String = ""
    @State var avatar_url: String = ""
    @State var html_url: String = ""

    var repository: FavoritesRepository
    
    var body: some View {
        VStack {
            URLImage(URL(string: avatar_url)!) { image in
                image.resizable().frame(width: 120, height: 120)
            }
            TextField(NSLocalizedString("Username", comment: "Username label"), text: $login)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField(NSLocalizedString("API URL", comment: "API URL"), text: $url)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField(NSLocalizedString("Website URL", comment: "Website URL"), text: $html_url)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .navigationBarTitle(NSLocalizedString("Update User", comment: "Update Favorite User"), displayMode: .inline)
        .navigationBarItems(trailing: Button {
            repository.updateUser(login: login, url: url, avatar_url: avatar_url, html_url: html_url)
            dismiss()
        } label: {
            Image(systemName: "checkmark")
                .font(.headline)
        }.disabled(login.isEmpty))
    }
}

struct FavoriteItemDetailView_Previews: PreviewProvider {
    static var repo = FavoritesRepository()
    static var previews: some View {
        FavoriteItemDetailView( repository: repo)
    }
}
