//
//  MainPageReminderRowView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 05.10.2021.
//

import SwiftUI

struct MainPageReminderRowView: View {
    let viewModel: ReminderViewModel
    
    var body: some View {
        HStack{
            Text(viewModel.drug.name)
            Spacer()
            Text(String(viewModel.reminder.dosage.amount))
        }.padding()
    }
}

//struct ReminderRowView_Previews: PreviewProvider {
//    static let reminderMock = ReminderMockProvider().getMock()
//
//    static var previews: some View {
//        return ReminderRowView(viewModel: reminderMock)
//    }
//}
