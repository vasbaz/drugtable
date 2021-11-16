//
//  DrugsRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

protocol DrugsRepository {
    func getDrugs() -> [Drug]
}

final class MockDrugsRepository: DrugsRepository, Singleton {
    static let shared = MockDrugsRepository()
    let provider = DrugsArrayMockProvider()
    var drugs: [Drug]
    
    init() {
        self.drugs = provider.getMock()
    }
    
    func getDrugs() -> [Drug] {
        self.drugs
    }
}
