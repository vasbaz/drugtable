//
//  RemindersPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.11.2021.
//

import Foundation

class RemindersPageViewModel {
    let remindersRepository: RemindersRepository
    let intervalsRepository: IntervalsRepository
    var remindersGroups: [RemindersGroupViewModel] = []
    
    init(remindersRepository: RemindersRepository, intervalsRepository: IntervalsRepository) {
        self.remindersRepository = remindersRepository
        self.intervalsRepository = intervalsRepository
        fillRemindersGroups()
    }
    
    func fillRemindersGroups() {
        let intervals = intervalsRepository.getIntervals()
        let reminders = remindersRepository.getReminders()
        remindersGroups = intervals.map() { RemindersGroupViewModel(interval: $0) }
        reminders.forEach( { reminder in
            let reminderGroup = remindersGroups.first(where: { $0.interval.id == reminder.intervalId})
            reminderGroup?.reminders.append(reminder)
        }
    )
    }
}
