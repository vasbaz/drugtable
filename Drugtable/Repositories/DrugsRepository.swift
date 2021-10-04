//
//  DrugsRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 04.10.2021.
//

import Foundation

class BaseDrugsRepository {}

protocol DrugsRepository: BaseDrugsRepository {
    func getDrugs() -> [Drug]
}

class MockDrugsRepository: BaseDrugsRepository, DrugsRepository {
    func getDrugs() -> [Drug] {
        let data: Data

        guard let file = Bundle.main.url(forResource: "DrugsExampleData.json", withExtension: nil)
        else {
            fatalError("Couldn't find mock file for drugs in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load mock file for drugs from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Drug].self, from: data)
        } catch {
            fatalError("Couldn't parse mock file for drugs:\n\(error)")
        }
    }
}
