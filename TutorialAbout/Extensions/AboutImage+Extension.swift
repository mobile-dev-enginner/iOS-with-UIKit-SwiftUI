//
//  AboutImage+Extension.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 09/12/2022.
//

import SwiftUI
/// All the image assets from the LetsEatAbout's assets our added.
public extension Image {
    static var about: Image {
        Image("about", bundle: .aboutModule)
    }

    static var store: Image {
        Image("store", bundle: .aboutModule)
    }

    static var chat: Image {
        Image("chat", bundle: .aboutModule)
    }

    static var twitter: Image {
        Image("twitter", bundle: .aboutModule)
    }

    static var facebook: Image {
        Image("facebook", bundle: .aboutModule)
    }

    static var instagram: Image {
        Image("instagram", bundle: .aboutModule)
    }
}
