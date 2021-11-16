//
//  RemindersGroupViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.10.2021.
//

import Foundation

final class RemindersGroupViewModel: Identifiable {
    let id = UUID()
    let interval: Interval
    var reminderViewModels: [ReminderViewModel]
    
    init(interval: Interval) {
        self.interval = interval
        self.reminderViewModels = []
    }
    
    init(interval: Interval, reminderViewModels: [ReminderViewModel]) {
        self.interval = interval
        self.reminderViewModels = reminderViewModels
    }
}
