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
    var reminders: [Reminder]
    
    init() {
        FirebaseApp.configure()
        reminders = RemindersArrayMockProvider().getMock()
    }
    
    var body: some Scene {
        WindowGroup {
            RemindersGroupView(reminders: reminders)
        }
    }
}
