//
//  DrugsRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import Combine

class BaseDrugsRepository {
    @Published var drugs: [Drug] = []
}

protocol DrugsRepository: BaseDrugsRepository, Singleton {}

final class MockDrugsRepository: BaseDrugsRepository, DrugsRepository {
    static let shared = MockDrugsRepository()
    let provider = DrugsArrayMockProvider()
    
    override init() {
        super.init()
        self.drugs = provider.getMock()
    }
}
