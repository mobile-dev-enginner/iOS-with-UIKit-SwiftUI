//
//  WebLink.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 09/12/2022.
//

import SwiftUI
public enum WebLink: String, Identifiable {
    public var id: UUID {
        UUID()
    }
    case rateUs = "https://github.com/DevOpsThinh/iOS-with-UIKit-SwiftUI"
    case feedback = "https://github.com/DevOpsThinh/iOS-with-UIKit-SwiftUI/discussions"
    case github = "https://github.com/DevOpsThinh"
    case twitter = "https://twitter.com/bee_mobile_dev"
    case facebook = "https://www.facebook.com/thinh.devops.3"
    case instagram = "https://www.instagram.com"
}
