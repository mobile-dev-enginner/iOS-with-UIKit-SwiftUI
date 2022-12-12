//
//  NurtureListView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 12/12/2022.
//

import SwiftUI
import PetKit

struct NurtureListView: View {
    // MARK: - STATE VARIABLES
    /// Keep track of whether the add moment view
    @State private var isPickingMoment = false
    /// A new SwiftUI-centric nurture
    @StateObject var nurture = Nurture()

    // MARK: - SOME SORT OF VIEW
    var body: some View {
        NavigationView {
            VStack {
                AddNurtureItemView(
                    isPetSleeping: nurture.isPetSleeping) { kind in
                    // print("Selected \(kind.description)")
                    if kind == .moment {
                        isPickingMoment = true
                        return
                    }
                        nurture.addItem(of: kind)}
                    .padding([.top, .bottom], 8)
                // Real Nurture Row List
                List(nurture.items, id: \.date) { item in
                    NurtureRow(nurtureItem: item)
                }
            }
            .navigationTitle(NSLocalizedString("Pet Track", comment: "Pet Track"))
            .navigationBarTitleDisplayMode(.automatic)
        }
        .sheet(isPresented: $isPickingMoment) {
            ImagePicker(isPresented: $isPickingMoment, nurture: nurture)
        }
        .accentColor(Color("AccentColor"))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NurtureListView_Previews: PreviewProvider {
    static var previews: some View {
        NurtureListView()
    }
}
