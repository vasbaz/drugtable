//
//  DrugsRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 04.10.2021.
//

import Foundation

protocol RemindersRepository {
    func getReminders() -> [Reminder]
}

class MockRemindersRepository: RemindersRepository {
    let provider = RemindersArrayMockProvider()
    var reminders: [Reminder]
    
    init() {
        self.reminders = provider.getMock()
    }
    
    func getReminders() -> [Reminder] {
        self.reminders
    }
}
