//
//  RemindersGroupView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 06.10.2021.
//

import SwiftUI

struct RemindersGroupView: View {
    let reminders: [Reminder]
    
    var body: some View {
        GroupBox(label: Text("Morning")) {
            List(reminders, id: \.self) {
                reminder in ReminderRowView(reminder: reminder)
            }
        }
    }
}

struct RemindersGroupView_Previews: PreviewProvider {
    static var previews: some View {
        let reminders = RemindersArrayMockProvider().getMock()
        RemindersGroupView(reminders: reminders)
    }
}
