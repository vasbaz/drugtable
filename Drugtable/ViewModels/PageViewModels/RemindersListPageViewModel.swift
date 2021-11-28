//
//  RemindersListPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import Foundation
import Combine

final class RemindersListPageViewModel: ObservableObject {
    let remindersRepository: RemindersRepository = MockRemindersRepository.shared
    let intervalsRepository: IntervalsRepository = MockIntervalsRepository.shared
    let drugsRepository: DrugsRepository = MockDrugsRepository.shared
    
    @Published var reminderViewModels: [ReminderViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        reminderViewModelsPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.reminderViewModels, on: self)
            .store(in: &cancellables)
    }
    
    private var reminderViewModelsPublisher: AnyPublisher<[ReminderViewModel], Never> {
        Publishers.CombineLatest3(remindersRepository.$reminders, intervalsRepository.$intervals, drugsRepository.$drugs)
            .map(makeReminderViewModels)
            .eraseToAnyPublisher()
    }
    
    func makeReminderViewModels(reminders: [Reminder], intervals: [Interval], drugs: [Drug]) -> [ReminderViewModel]  {
        let rawReminderViewModels: [ReminderViewModel?] = reminders.map() { reminder in
            guard let interval = intervals.first(where: { $0.id == reminder.intervalId }) else {
                return nil
            }
            
            guard let drug = drugs.first(where: { $0.id == reminder.drugId }) else {
                return nil
            }
            
            return ReminderViewModel(reminder: reminder, drug: drug, interval: interval)
        }
        
        return rawReminderViewModels.compactMap { $0 }
    }
    
    func onDeleteHandler(atOffsets indexSet: IndexSet) {
        let remindersToDeleteIds = indexSet.lazy.map { self.reminderViewModels[$0].reminder.id }
        remindersToDeleteIds.forEach {remindersRepository.deleteReminderById($0) }
    }
}
