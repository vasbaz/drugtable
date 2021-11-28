//
//  IntervalsRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.11.2021.
//

import Combine

class BaseIntervalsRepository {
    @Published var intervals: [Interval] = []
}

protocol IntervalsRepository: BaseIntervalsRepository, Singleton {}

final class MockIntervalsRepository: BaseIntervalsRepository, IntervalsRepository {
    static let shared = MockIntervalsRepository()
    let provider = IntervalsArrayMockProvider()
    
    override init() {
        super.init()
        self.intervals = provider.getMock()
    }
}
