//
//  IntervalsRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.11.2021.
//

import Foundation

protocol IntervalsRepository {
    func getIntervals() -> [Interval]
}

class MockIntervalsRepository: IntervalsRepository {
    let provider = IntervalsArrayMockProvider()
    var intervals: [Interval]
    
    init() {
        self.intervals = provider.getMock()
    }
    
    func getIntervals() -> [Interval] {
        self.intervals
    }
}
