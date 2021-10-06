//
//  RemindersArrayMockProvider.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 06.10.2021.
//

import Foundation

class ReminderMockProvider: MockProvider {
    let drugMock = Drug(id: 1, name: "Galoperidol")
    let dosageMock = Dosage(amount: "3 pills")
    let drugTakingTimeMock = DrugTakingTime(time: "After dinner")
    
    func getMock() -> Reminder {
        Reminder(drug: drugMock, dosage: dosageMock, takingTime: drugTakingTimeMock)
    }
}
