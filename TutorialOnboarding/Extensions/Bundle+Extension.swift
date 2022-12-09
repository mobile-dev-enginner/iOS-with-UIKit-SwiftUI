//
//  Bundle+Extension.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 09/12/2022.
//

import Foundation

extension Bundle {
    /// A TutorialOnboarding module with its idenfifier
    public static var module: Bundle? {
        // Help in accessing the assets, ...
        Bundle(identifier: "com.forever.bee.TutorialOnboarding")
    }
}
