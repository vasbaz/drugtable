//
//  drug.swift
//  drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 04.10.2021.
//

import Foundation

struct Drug: Hashable, Codable, Identifiable {
    let id: String
    let name: String
}
