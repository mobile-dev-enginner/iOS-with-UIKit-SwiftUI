//
//  GithubUser.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 07/12/2022.
//

import Foundation

/// A `Result` struct type to encapsulate the first level of the JSON results
struct Result: Codable {
    var items: [GithubUser]
}
/// A `GithubUser` struct type with the properties that we want from the JSON results
struct GithubUser: Codable {
    public var login: String
    public var url: String
    public var avatar_url: String
    public var html_url: String
}

