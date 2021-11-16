//
//  DrugsRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 04.10.2021.
//

protocol RemindersRepository {
    func getReminders() -> [Reminder]
}

final class MockRemindersRepository: RemindersRepository, Singleton {
    static let shared = MockRemindersRepository()
    let provider = RemindersArrayMockProvider()
    var reminders: [Reminder]
    
    init() {
        self.reminders = provider.getMock()
    }
    
    func getReminders() -> [Reminder] {
        self.reminders
    }
}
