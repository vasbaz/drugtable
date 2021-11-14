//
//  IntervalsArrayMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.11.2021.
//

import Foundation

class IntervalsArrayMockProvider: MockFromFileProvider {
    typealias MockType = [Interval]
    
    let filename = "IntervalsArrayMock.json"
}
