//
//  MainPageView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 14.10.2021.
//

import SwiftUI

struct MainPageView: View {
    let viewModel: MainPageViewModel = MainPageViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach (viewModel.remindersGroups) { group in MainPageRemindersGroupView(viewModel: group) }
            }
            .listStyle(.plain)
            NavigationLink(destination: SettingsPageView(viewModel: SettingsPageViewModel())) {
                Text("Settings")
            }
        }
        .navigationBarTitle("Reminders")
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
