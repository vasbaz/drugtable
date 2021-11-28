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

protocol DrugsRepository: BaseDrugsRepository, Singleton {
    func deleteDrugById(_ id: DrugId)
}

final class MockDrugsRepository: BaseDrugsRepository, DrugsRepository {
    static let shared = MockDrugsRepository()
    let provider = DrugsArrayMockProvider()
    
    override init() {
        super.init()
        self.drugs = provider.getMock()
    }
    
    func deleteDrugById(_ id: DrugId) {
        if let drugToDeleteIndex = drugs.firstIndex(where: { $0.id == id }) {
            drugs.remove(at: drugToDeleteIndex)
        }
        // ToDo: delete reminders
    }
}
