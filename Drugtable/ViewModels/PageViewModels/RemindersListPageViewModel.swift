//
//  RemindersListPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

final class RemindersListPageViewModel {
    let remindersRepository: RemindersRepository = MockRemindersRepository()
    let intervalsRepository: IntervalsRepository = MockIntervalsRepository()
    let drugsRepository: DrugsRepository = MockDrugsRepository()
    
    var reminders: [Reminder] = []
    var intervals: [Interval] = []
    var drugs: [Drug] = []
    
    var reminderViewModels: [ReminderViewModel] = []
    
    init() {
        reminders = remindersRepository.getReminders()
        drugs = drugsRepository.getDrugs()
        intervals = intervalsRepository.getIntervals()
        
        fillReminderViewModels()
    }
    
    func refresh() {
        reminders = remindersRepository.getReminders()
        drugs = drugsRepository.getDrugs()
        intervals = intervalsRepository.getIntervals()
        
        fillReminderViewModels()
    }
    
    func fillReminderViewModels() {
        let rawReminderViewModels: [ReminderViewModel?] = reminders.map() { reminder in
            guard let interval = intervals.first(where: { $0.id == reminder.intervalId }) else {
                return nil
            }
            
            guard let drug = drugs.first(where: { $0.id == reminder.drugId }) else {
                return nil
            }
            
            return ReminderViewModel(reminder: reminder, drug: drug, interval: interval)
        }
        
        reminderViewModels = rawReminderViewModels.compactMap { $0 }
    }
}
