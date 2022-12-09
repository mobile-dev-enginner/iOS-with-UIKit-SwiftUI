//
//  AboutView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 09/12/2022.
//

import SwiftUI

public struct AboutView: View {

    private var items: [AboutModel] = []

    public init (react_items: [AboutModel]) {
        self.items = react_items
    }

    public var body: some View {
        NavigationView {
            VStack {
                AboutBackgroundView()
                    .padding(.top, -15)

                List {
                    Section(
                        header: Text(NSLocalizedString("IMPROVEMENT US", comment: "IMPROVEMENT US"))
                                .font(.custom("Nunito-Regular", size: 25, relativeTo: .largeTitle))
                    ) {
                        ForEach(improvementCase(items: items)) {
                            AboutSectionView(aboutModel: $0)
                        }
                    }

                    Section(
                        header: Text(NSLocalizedString("CONNECTING WITH US", comment: "CONNECTING WITH US"))
                                .font(.custom("Nunito-Regular", size: 25, relativeTo: .largeTitle))
                    ) {
                        ForEach(socialCase(items: items)) {
                            AboutSectionView(aboutModel: $0)
                        }
                    }
                }
                .listStyle(.grouped)
                .padding(.top, -15)

                Spacer()
            }
            .navigationTitle(NSLocalizedString("About", comment: "About"))
            .navigationBarTitleDisplayMode(.automatic)
        }
    }

    // MARK: - METHODS
    private func improvementCase(items: [AboutModel]) -> [AboutModel] {
        var itemList = [AboutModel]()

        for item in items {
            if item.category == .improvement {
                itemList.append(item)
            }
        }
        return itemList
    }

    private func socialCase(items: [AboutModel]) -> [AboutModel] {
        var itemList = [AboutModel]()

        for item in items {
            if item.category == .social {
                itemList.append(item)
            }
        }
        return itemList
    }
}

private extension PreviewProvider {
    static var mockReactionModels: [AboutModel] {
        [
            AboutModel(category: .social, title: "Twitter", iconName: "twitter", url: .twitter),
            AboutModel(category: .social, title: "Facebook", iconName: "facebook", url: .facebook),
            AboutModel(category: .improvement, title: "Tell us your feedback", iconName: "chat", url: .feedback),
            AboutModel(category: .improvement, title: "Discover us on GitHub Profile", iconName: "github", url: .github)
        ]
    }
}

struct LetsEatAboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(react_items: mockReactionModels)
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
            .previewDisplayName("iPhone SE 2nd")
    }
}
