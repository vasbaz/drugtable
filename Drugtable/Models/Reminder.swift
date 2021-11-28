//
//  Reminder.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 05.10.2021.
//

typealias ReminderId = String

struct Reminder: Hashable, Codable, Identifiable {
    let id: ReminderId
    let drugId: DrugId
    let dosage: Dosage
    let intervalId: IntervalId
    let inListPosition: Int
}
