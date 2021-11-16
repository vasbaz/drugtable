//
//  RemindersArrayMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 06.10.2021.
//

final class RemindersArrayMockProvider: MockFromFileProvider {
    typealias MockType = [Reminder]
    
    let filename = "RemindersArrayMock.json"
}
