//
//  DrugListPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import Foundation
import Combine
import Resolver

final class DrugsListPageViewModel: ObservableObject {
    @Injected var drugsRepository: DrugsRepository
    @Published var drugs: [Drug] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        drugsRepository
            .$drugs
            .receive(on: RunLoop.main)
            .assign(to: \.drugs, on: self)
            .store(in: &cancellables)
    }
}
