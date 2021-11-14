//
//  drugtableApp.swift
//  drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 03.10.2021.
//

import SwiftUI
import Firebase

@main
struct DrugtableApp: App {
    let remindersRepository: RemindersRepository
    let intervalsRepository: IntervalsRepository
    let remindersPageViewModel: RemindersPageViewModel
    
    init() {
        FirebaseApp.configure()
        remindersRepository = MockRemindersRepository()
        intervalsRepository = MockIntervalsRepository()
        remindersPageViewModel = RemindersPageViewModel(remindersRepository: remindersRepository, intervalsRepository: intervalsRepository)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                RemindersPageView(viewModel: remindersPageViewModel)
            }
        }
    }
}
