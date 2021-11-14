//
//  RemindersPage.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.10.2021.
//

import SwiftUI

struct RemindersPage: View {
    let reminders: [Reminder]
    
    var body: some View {
        VStack {
            List {
                RemindersGroupView(reminders: reminders)
            }
            .listStyle(.plain)
            NavigationLink(destination: SettingsPage(viewModel: SettingsPageViewModel())) {
                Text("Settings")
            }
        }
        .navigationBarTitle("Reminders")
    }
}

struct RemindersPage_Previews: PreviewProvider {
    static var previews: some View {
        let reminders = RemindersArrayMockProvider().getMock()
        RemindersPage(reminders: reminders)
    }
}
