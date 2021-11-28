//
//  ListPageReminderRowView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 17.11.2021.
//

import SwiftUI

struct ReminderRowListPageView: View {
    let viewModel: ReminderViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.drug.name)
                .font(.headline)
            
            HStack {
                Text(String(viewModel.reminder.dosage.amount))
                Spacer()
                Text(String(viewModel.interval.name))
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            
        }
        .padding(.horizontal, 6.0)
        .padding(.vertical, 4.0)
    }
}

struct ReminderRowListPageView_Previews: PreviewProvider {
    static let reminderViewModelMock = ReminderViewModelMockProvider().getMock()
    
    static var previews: some View {
        ReminderRowListPageView(viewModel: reminderViewModelMock).previewLayout(.sizeThatFits)
    }
}
