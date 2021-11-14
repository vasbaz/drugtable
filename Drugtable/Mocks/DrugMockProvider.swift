//
//  DrugMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.10.2021.
//

import Foundation

class DrugMockProvider: MockProvider {
    func getMock() -> Drug {
        Drug(id: "1", name: "Galoperidol")
    }
}
