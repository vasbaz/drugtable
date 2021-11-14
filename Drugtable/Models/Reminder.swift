//
//  Reminder.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 05.10.2021.
//

import Foundation

struct Reminder: Hashable, Codable, Identifiable {
    let id: String
    let drug: Drug
    let dosage: Dosage
    let interval: Interval
}
