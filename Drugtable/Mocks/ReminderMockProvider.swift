//
//  RemindersArrayMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 06.10.2021.
//

import Foundation

class ReminderMockProvider: MockProvider {
    let drugMock = DrugMockProvider().getMock()
    let dosageMock = DosageMockProvider().getMock()
    let drugTakingTimeMock = IntervalMockProvider().getMock()
    
    func getMock() -> Reminder {
        Reminder(id: "0", drug: drugMock, dosage: dosageMock, intervalId: drugTakingTimeMock.id)
    }
}
