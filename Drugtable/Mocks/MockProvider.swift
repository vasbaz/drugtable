//
//  MockRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 06.10.2021.
//

import Foundation

protocol MockProvider {
    associatedtype MockType
    func getMock() -> MockType
}

protocol MockFromFileProvider: MockProvider where MockType: Decodable {
    var filename: String { get }
}

extension MockFromFileProvider {
    func getMock() -> MockType {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        let data: Data
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(MockType.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(MockType.self):\n\(error)")
        }
    }
}
