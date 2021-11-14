//
//  drug.swift
//  drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 04.10.2021.
//

import Foundation

typealias DrugId = String

struct Drug: Hashable, Codable, Identifiable {
    let id: DrugId
    let name: String
}
