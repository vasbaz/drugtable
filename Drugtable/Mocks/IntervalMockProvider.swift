//
//  IntervalMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.10.2021.
//

import Foundation

class IntervalMockProvider: MockProvider {
    func getMock() -> Interval {
        Interval(id: "0", order: 0, name: "After dinner", theme: .warmOrange)
    }
}
