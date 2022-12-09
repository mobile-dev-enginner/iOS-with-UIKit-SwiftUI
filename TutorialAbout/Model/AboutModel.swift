//
//  AboutModel.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 09/12/2022.
//

import SwiftUI
/// A `AboutCategory` enumertion cases (improvement, social) of the About model's category
public enum AboutCategory: String, CaseIterable {
    case improvement = "improvement"
    case social = "social"
}

public struct AboutModel: Identifiable {
    public let id = UUID()
    let category: AboutCategory
    // Icons, title that appears on the about screen
    let iconName: String
    let title: String
    let url: WebLink

    public init(
        category: AboutCategory,
        title: String,
        iconName: String,
        url: WebLink
    ) {
        self.category = category
        self.title = title
        self.iconName = iconName
        self.url = url
    }
}
