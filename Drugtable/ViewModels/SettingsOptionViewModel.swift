//
//  SettingsOptionViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 13.11.2021.
//

import Foundation

enum OptionType {
    case login, register, myDrugs, reminders, intervals, aboutApp
}

struct SettingsOptionViewModel: Identifiable {
    let id = UUID()
    let title: String
    let optionType: OptionType
}

