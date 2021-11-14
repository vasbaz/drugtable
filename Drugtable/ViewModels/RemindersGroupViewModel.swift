//
//  RemindersGroupViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.10.2021.
//

import Foundation

class RemindersGroupViewModel: Identifiable {
    let id = UUID()
    let interval: Interval
    var reminders: [Reminder]
    
    init(interval: Interval) {
        self.interval = interval
        self.reminders = []
    }
    
    init(interval: Interval, reminders: [Reminder]) {
        self.interval = interval
        self.reminders = reminders
    }
}
