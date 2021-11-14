//
//  RemindersPage.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.10.2021.
//

import SwiftUI

struct RemindersPageView: View {
    let viewModel: RemindersPageViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach (viewModel.remindersGroups) { group in RemindersGroupView(viewModel: group) }
            }
            .listStyle(.plain)
            NavigationLink(destination: SettingsPageView(viewModel: SettingsPageViewModel())) {
                Text("Settings")
            }
        }
        .navigationBarTitle("Reminders")
    }
}

struct RemindersPageView_Previews: PreviewProvider {
    static let remindersRepository = MockRemindersRepository()
    static let intervalsRepository = MockIntervalsRepository()
    static let viewModel = RemindersPageViewModel(remindersRepository: remindersRepository, intervalsRepository: intervalsRepository)
    
    static var previews: some View {
        RemindersPageView(viewModel: viewModel)
    }
}
