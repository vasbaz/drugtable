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

protocol IntervalsRepository: BaseIntervalsRepository {
    func deleteIntervalById(_ id: ReminderId)
}

final class MockIntervalsRepository: BaseIntervalsRepository, IntervalsRepository {
    let provider = IntervalsArrayMockProvider()
    
    override init() {
        super.init()
        self.intervals = provider.getMock()
    }
    
    func deleteIntervalById(_ id: IntervalId) {
        if let intervalToDeleteIndex = intervals.firstIndex(where: { $0.id == id }) {
            intervals.remove(at: intervalToDeleteIndex)
        }
        // ToDo: delete reminders
    }
}
