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
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
