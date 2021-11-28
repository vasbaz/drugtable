//
//  ReminderViewModelMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 28.11.2021.
//

import Foundation

final class ReminderViewModelMockProvider: MockProvider {
    let mainPageViewModel = MainPageViewModel();
    
    func getMock() -> ReminderViewModel {
        mainPageViewModel.remindersGroups[0].reminderViewModels[0]
    }
}
