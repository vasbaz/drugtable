//
//  SettingsOptionView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 13.11.2021.
//

import SwiftUI

struct SettingsOptionView: View {
    let option: SettingsOptionViewModel

    @ViewBuilder func resolveDestination(optionType: OptionType) -> some View {
        switch optionType {
        case .login:
            LoginPageView();
        case .register:
            RegisterPageView();
        default:
            EmptyView();
        }
    }
    
    var body: some View {
        NavigationLink(destination: resolveDestination(optionType: option.optionType)) {
            HStack {
                Text(option.title)
            }
        }
    }
}

enum SettingsOptionsError: Error {
    case routing
}

struct SettingsOptionView_Previews: PreviewProvider {
    static let option = SettingsOptionMockProvider().getMock()
    
    static var previews: some View {
        SettingsOptionView(option: option)
    }
}
