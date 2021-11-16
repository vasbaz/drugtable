//
//  SettingsOptionMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 13.11.2021.
//

final class SettingsOptionMockProvider: MockProvider {
    func getMock() -> SettingsOptionViewModel {
        SettingsOptionViewModel(title: "About app", optionType: .aboutApp)
    }
}
