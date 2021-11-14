//
//  IntervalMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.10.2021.
//

import Foundation

class IntervalMockProvider: MockProvider {
    func getMock() -> Interval {
        Interval(time: "After dinner", theme: .warmOrange)
    }
}
