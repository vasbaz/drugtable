//
//  MainPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.11.2021.
//

import Foundation
import Combine

final class MainPageViewModel: ObservableObject {
    let remindersRepository: RemindersRepository = MockRemindersRepository.shared
    let intervalsRepository: IntervalsRepository = MockIntervalsRepository.shared
    let drugsRepository: DrugsRepository = MockDrugsRepository.shared
    
    @Published var remindersGroups: [RemindersGroupViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        makeRemindersGroupsPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.remindersGroups, on: self)
            .store(in: &cancellables)
    }
    
    private var makeRemindersGroupsPublisher: AnyPublisher<[RemindersGroupViewModel], Never> {
        Publishers.CombineLatest3(remindersRepository.$reminders, intervalsRepository.$intervals, drugsRepository.$drugs)
            .map(makeRemindersGroups)
            .eraseToAnyPublisher()
    }
    
    func makeRemindersGroups(reminders: [Reminder], intervals: [Interval], drugs: [Drug]) -> [RemindersGroupViewModel] {
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
        
        return remindersGroups.filter { !$0.reminderViewModels.isEmpty }
    }
}
