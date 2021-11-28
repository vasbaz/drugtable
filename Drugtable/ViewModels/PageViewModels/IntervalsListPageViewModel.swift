//
//  IntervalsListPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import Foundation
import Combine

final class IntervalsListPageViewModel: ObservableObject {
    @Published var intervalsRepository: IntervalsRepository = MockIntervalsRepository()
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
