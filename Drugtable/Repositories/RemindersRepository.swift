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

protocol RemindersRepository: BaseRemindersRepository, Singleton {}

final class MockRemindersRepository: BaseRemindersRepository, RemindersRepository {
    static let shared = MockRemindersRepository()
    let provider = RemindersArrayMockProvider()
    
    override init() {
        super.init()
        self.reminders = provider.getMock()
    }
}
