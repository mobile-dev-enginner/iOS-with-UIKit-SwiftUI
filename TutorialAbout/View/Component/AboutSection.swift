//
//  AboutSection.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 09/12/2022.
//

import SwiftUI

struct AboutSectionView: View {
    @State private var link: WebLink?

    let aboutModel: AboutModel
    
    var body: some View {
        Link(destination: URL(string: aboutModel.url.rawValue)!, label: {
            Label(aboutModel.title, image: aboutModel.iconName)
                .foregroundColor(Color.aboutAccentColor)
                .onTapGesture {
                    link = aboutModel.url
                }
        })
            .sheet(item: $link) { i in
                if let url = URL(string: i.rawValue) {
                    SafariView(url: url)
                }
            }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutSectionView(aboutModel: AboutModel(category: .improvement, title: "App Store", iconName: "store", url: .rateUs))
    }
}

