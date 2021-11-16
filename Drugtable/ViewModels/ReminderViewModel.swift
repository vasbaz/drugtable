//
//  ReminderViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import Foundation

struct ReminderViewModel: Identifiable {
    let id = UUID()
    let reminder: Reminder
    let drug: Drug
    let interval: Interval
}
