//
//  About.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 09/12/2022.
//

import SwiftUI

struct About: Identifiable {
    let id = UUID()

    let aboutImage: Image
    let position: CGPoint
}

extension About {
    static let backgroundAbouts: [About] = {
        let bounds = UIScreen.main.bounds
        return [
            About(
                aboutImage: .about,
                position: .init(
                    x: bounds.maxX / 2.3,
                    y: bounds.maxY / 7)
            )
        ]
    }()
}

