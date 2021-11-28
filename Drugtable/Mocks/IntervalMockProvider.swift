//
//  IntervalMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 28.11.2021.
//

import Foundation

final class IntervalMockProvider: MockProvider {
    let intervalsArrayMock = IntervalsArrayMockProvider().getMock()
    
    func getMock() -> Interval {
        intervalsArrayMock[0]
    }
}
