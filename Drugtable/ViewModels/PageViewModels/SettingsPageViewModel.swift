//
//  SettingsPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 13.11.2021.
//

import Foundation

struct SettingsPageViewModel {
    var groups: [SettingsOptionsGroupViewModel] {
        get {
            [
                accountGroup,
                mainGroup,
            ]
        }
    }
    
    var accountGroup: SettingsOptionsGroupViewModel {
        get {
            SettingsOptionsGroupViewModel(
                title: "Account",
                options: [
                    SettingsOptionViewModel(title: "Log in", optionType: .login),
                    SettingsOptionViewModel(title: "Register", optionType: .register)
                ]
            )
        }
    }

    var mainGroup: SettingsOptionsGroupViewModel {
        get {
            SettingsOptionsGroupViewModel(
                title: "General",
                options: [
                    SettingsOptionViewModel(title: "My drugs", optionType: .myDrugs),
                    SettingsOptionViewModel(title: "Reminders", optionType: .reminders),
                    SettingsOptionViewModel(title: "Intervals", optionType: .intervals),
                ]
            )
        }
    }
}


