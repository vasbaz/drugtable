//
//  DrugTakingTime.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 05.10.2021.
//

typealias IntervalId = String

enum IntervalTheme: String, Codable {
    case warmOrange, blueGreen
}

struct Interval: Hashable, Codable, Identifiable {
    let id: IntervalId
    let order: Int
    let name: String
    let theme: IntervalTheme
}
