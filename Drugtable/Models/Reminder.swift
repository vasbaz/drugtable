//
//  Reminder.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 05.10.2021.
//

import Foundation

typealias ReminderId = String

struct Reminder: Hashable, Codable, Identifiable {
    let id: ReminderId
    let drug: Drug
    let dosage: Dosage
    let intervalId: IntervalId
}
