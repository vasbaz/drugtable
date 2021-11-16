//
//  RemindersListPageView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import SwiftUI

struct RemindersListPageView: View {
    let viewModel = RemindersListPageViewModel();
    
    var body: some View {
        List {
            ForEach (viewModel.reminderViewModels) {
                reminderViewModel in MainPageReminderRowView(viewModel: reminderViewModel)
            }
        }.navigationBarTitle("Edit reminders")
    }
}

struct RemindersListPageView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersListPageView()
    }
}
