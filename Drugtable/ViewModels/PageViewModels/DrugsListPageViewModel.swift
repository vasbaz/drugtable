//
//  DrugListPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import Foundation

final class DrugsListPageViewModel {
    let drugsRepository: DrugsRepository = MockDrugsRepository()
    
    var drugs: [Drug] = []
    
    init() {
        drugs = drugsRepository.getDrugs()
    }
}
