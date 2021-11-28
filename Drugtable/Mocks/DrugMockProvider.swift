//
//  DrugMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 28.11.2021.
//

import Foundation

final class DrugMockProvider: MockProvider {
    let drugsArrayMock = DrugsArrayMockProvider().getMock()
    
    func getMock() -> Drug {
        drugsArrayMock[0]
    }
}
