//
//  SettingsOptionView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 13.11.2021.
//

import SwiftUI
import Resolver

struct SettingsOptionView: View {
    @Injected var authRepository: AuthRepository
    
    let option: SettingsOptionViewModel
    
    @ViewBuilder func resolveDestination(optionType: OptionType) -> some View {
        switch optionType {
        case .login:
            LoginPageView();
        case .register:
            RegisterPageView();
        case .remindersList:
            RemindersListPageView();
        case .drugsList:
            DrugsListPageView();
        case .intervalsList:
            IntervalsListPageView();
        default:
            EmptyView();
        }
    }
    
    var body: some View {
        if (option.optionType == .profile) {
            HStack {
                Text(authRepository.user?.email ?? "No email")
            }
        }
        else if (option.optionType == .logout) {
            Button(action: { authRepository.logOut() }) {
                HStack {
                    Text(LocalizedStringKey(option.title))
                }
            }
        }
        else {
            NavigationLink(destination: resolveDestination(optionType: option.optionType)) {
                HStack {
                    Text(LocalizedStringKey(option.title))
                }
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
        SettingsOptionView(option: option).previewLayout(.sizeThatFits)
    }
}
