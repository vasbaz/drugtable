//
//  MainPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.11.2021.
//

class MainPageViewModel {
    let remindersRepository: RemindersRepository = MockRemindersRepository()
    let intervalsRepository: IntervalsRepository = MockIntervalsRepository()
    let drugsRepository: DrugsRepository = MockDrugsRepository()
    
    var remindersGroups: [RemindersGroupViewModel] = []
    
    init() {
        fillRemindersGroups()
    }
    
    func fillRemindersGroups() {
        let intervals = intervalsRepository.getIntervals()
        let reminders = remindersRepository.getReminders()
        let drugs = drugsRepository.getDrugs()
        
        remindersGroups = intervals.map { RemindersGroupViewModel(interval: $0) }
        reminders.forEach { reminder in
            guard let reminderGroup = remindersGroups.first(where: { $0.interval.id == reminder.intervalId}) else {
                return
            }
            
            guard let drug = drugs.first(where: { $0.id == reminder.drugId }) else {
                return
            }
            
            let reminderViewModel = ReminderViewModel(reminder: reminder, drug: drug, interval: reminderGroup.interval)
            
            reminderGroup.reminderViewModels.append(reminderViewModel)
        }
        remindersGroups = remindersGroups.filter { !$0.reminderViewModels.isEmpty }
    }
}
