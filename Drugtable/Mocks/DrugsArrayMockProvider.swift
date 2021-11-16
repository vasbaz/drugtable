//
//  DrugsArrayMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

final class DrugsArrayMockProvider: MockFromFileProvider {
    typealias MockType = [Drug]
    
    let filename = "DrugsArrayMock.json"
}
