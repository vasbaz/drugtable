//
//  IntervalsListPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import Foundation
import Combine
import Resolver

final class IntervalsListPageViewModel: ObservableObject {
    @Injected var intervalsRepository: IntervalsRepository
    @Published var intervals: [Interval] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        intervalsRepository
            .$intervals
            .receive(on: RunLoop.main)
            .assign(to: \.intervals, on: self)
            .store(in: &cancellables)
    }
}
