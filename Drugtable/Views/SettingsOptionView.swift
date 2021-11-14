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
            LoginPage();
        case .register:
            RegisterPage();
        default:
            EmptyView();
//                throw SettingsOptionsError.routing
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
