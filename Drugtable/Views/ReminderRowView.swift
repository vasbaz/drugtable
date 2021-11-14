//
//  ReminderRowView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 05.10.2021.
//

import SwiftUI

struct ReminderRowView: View {
    let reminder: Reminder
    
    var body: some View {
        HStack{
            Text(reminder.drug.name)
            Spacer()
            Text(String(reminder.dosage.amount))
        }.padding()
    }
}

struct ReminderRowView_Previews: PreviewProvider {
    static let reminderMock = ReminderMockProvider().getMock()

    static var previews: some View {
        return ReminderRowView(reminder: reminderMock)
    }
}
