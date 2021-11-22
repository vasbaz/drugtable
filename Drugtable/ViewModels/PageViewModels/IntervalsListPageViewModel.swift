//
//  IntervalsListPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import Foundation

final class IntervalsListPageViewModel {
    let intervalsRepository: IntervalsRepository = MockIntervalsRepository()
    
    var intervals: [Interval] = []
    
    init() {
        intervals = intervalsRepository.getIntervals()
    }
}
