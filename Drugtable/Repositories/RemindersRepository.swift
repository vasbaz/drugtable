//
//  DrugsRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 04.10.2021.
//

import Combine

class BaseRemindersRepository {
    @Published var reminders: [Reminder] = []
}

protocol RemindersRepository: BaseRemindersRepository, Singleton {
    func deleteReminderById(_ id: ReminderId)
}

final class MockRemindersRepository: BaseRemindersRepository, RemindersRepository {
    static let shared = MockRemindersRepository()
    let provider = RemindersArrayMockProvider()
    
    override init() {
        super.init()
        self.reminders = provider.getMock()
    }
    
    func deleteReminderById(_ id: ReminderId) {
        if let reminderToDeleteIndex = reminders.firstIndex(where: { $0.id == id }) {
            reminders.remove(at: reminderToDeleteIndex)
        }
    }
}
