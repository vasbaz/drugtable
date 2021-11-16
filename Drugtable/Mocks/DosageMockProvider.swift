//
//  DosageMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.10.2021.
//

final class DosageMockProvider: MockProvider {
    func getMock() -> Dosage {
        Dosage(amount: "3 pills")
    }
}
