//
//  AboutBackground.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 09/12/2022.
//

import SwiftUI

struct AboutBackgroundView: View {
    let backgroundAbout = About.backgroundAbouts

    var body: some View {
        ZStack {
            ForEach(backgroundAbout) { i in
                i.aboutImage
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct AboutBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        AboutBackgroundView()
    }
}
