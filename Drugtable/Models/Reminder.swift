//
//  Reminder.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 05.10.2021.
//

import Foundation

struct Reminder: Hashable, Codable {
    let drug: Drug
    let dosage: Dosage
    let takingTime: DrugTakingTime
}

extension Reminder: Exampled {
    static let example = Reminder(drug: Drug.example, dosage: Dosage.example, takingTime: DrugTakingTime.example)
}
