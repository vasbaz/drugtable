//
//  IntervalsRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.11.2021.
//

protocol IntervalsRepository {
    func getIntervals() -> [Interval]
}

final class MockIntervalsRepository: IntervalsRepository, Singleton {
    static let shared = MockIntervalsRepository()
    let provider = IntervalsArrayMockProvider()
    var intervals: [Interval]
    
    init() {
        self.intervals = provider.getMock()
    }
    
    func getIntervals() -> [Interval] {
        self.intervals
    }
}
