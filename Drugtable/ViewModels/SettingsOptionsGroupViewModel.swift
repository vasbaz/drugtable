//
//  SettingsOptionsGroupViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 13.11.2021.
//

import Foundation

struct SettingsOptionsGroupViewModel: Identifiable {
    let id = UUID()
    let title: String
    let options: [SettingsOptionViewModel]
}
