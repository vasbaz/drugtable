//
//  DrugDosage.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 05.10.2021.
//

import Foundation

struct Dosage: Hashable, Codable {
    let amount: String
}

extension Dosage: Exampled {
    static let example = Dosage(amount: "2 pills")
}
