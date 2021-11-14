//
//  SettingsPage.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 13.11.2021.
//

import SwiftUI

struct SettingsPageView: View {
    let viewModel: SettingsPageViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.groups) {
                group in Section(header: Text(group.title)) {
                    ForEach(group.options) {
                        option in SettingsOptionView(option: option)
                    }
                }
            }
        }.navigationBarTitle("Settings")
    }
}

struct SettingsPageView_Previews: PreviewProvider {
    static let viewModel = SettingsPageViewModel()
    
    static var previews: some View {
        SettingsPageView(viewModel: viewModel)
    }
}
