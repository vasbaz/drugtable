//
//  RemindersGroupViewMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 28.11.2021.
//

import Foundation

final class RemindersGroupViewMockProvider: MockProvider {
    let mainPageViewModel = MainPageViewModel();
    
    func getMock() -> RemindersGroupViewModel {
        mainPageViewModel.remindersGroups[0]
    }
}
