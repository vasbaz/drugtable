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
