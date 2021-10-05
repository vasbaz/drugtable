//
//  drug.swift
//  drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 04.10.2021.
//

import Foundation

struct Drug: Hashable, Codable {
    let id: Int
    let name: String
}

extension Drug: Exampled {
    static let example = Drug(id: 1, name: "Example drug")
}
