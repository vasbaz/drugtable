//
//  SettingsPageViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 13.11.2021.
//

import Foundation
import Combine
import Resolver

final class SettingsPageViewModel: ObservableObject {
    @Injected var authRepository: AuthRepository
    
    @Published var groups: [SettingsOptionsGroupViewModel]
    
    private var cancellables = Set<AnyCancellable>()
    
    private var unAuthAccountGroup = SettingsOptionsGroupViewModel(
        title: "Account",
        options: [
            SettingsOptionViewModel(title: "Log in", optionType: .login),
            SettingsOptionViewModel(title: "Registration", optionType: .register)
        ]
    )
    
    private var authAccountGroup = SettingsOptionsGroupViewModel(
        title: "Account",
        options: [
            SettingsOptionViewModel(title: "Profile", optionType: .profile),
            SettingsOptionViewModel(title: "Log out", optionType: .logout)
        ]
    )

    private var mainGroup: SettingsOptionsGroupViewModel = SettingsOptionsGroupViewModel(
        title: "General",
        options: [
            SettingsOptionViewModel(title: "Reminders", optionType: .remindersList),
            SettingsOptionViewModel(title: "My drugs", optionType: .drugsList),
            SettingsOptionViewModel(title: "Intervals", optionType: .intervalsList),
        ]
    )
    
    init() {
        groups = [unAuthAccountGroup, mainGroup]
        authRepository
            .$user
            .receive(on: RunLoop.main)
            .map({ $0?.email != nil ? [self.authAccountGroup, self.mainGroup] : [self.unAuthAccountGroup, self.mainGroup]})
            .assign(to: \.groups, on: self)
            .store(in: &cancellables)
    }
}


