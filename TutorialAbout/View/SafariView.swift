//
//  SafariView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 09/12/2022.
//

import SwiftUI
import SafariServices
/// Integrate SFSafariViewController with SwiftUI projects
public struct SafariView: UIViewControllerRepresentable {
    var url: URL

    public func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    public func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
       // Do some thing here.
    }
}
