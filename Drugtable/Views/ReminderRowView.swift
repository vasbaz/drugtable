//
//  DrugRowView.swift
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
            Text(String(reminder.takingTime.time))
        }.padding()
    }
}

struct ReminderRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderRowView(reminder: Reminder.example)
    }
}
