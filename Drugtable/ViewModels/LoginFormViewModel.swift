//
//  LoginFormViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 21.10.2021.
//

import Foundation
import SwiftUI
import Combine
import Resolver


final class LoginFormViewModel: ObservableObject {
    static let debounceFor = RunLoop.SchedulerTimeType.Stride(0.375)
    
    @Injected var authRepository: AuthRepository
    
    // Inputs
    @Published var login = ""
    @Published var password = ""
    
    // Outputs
    @Published var loginMessage: LocalizedStringKey = ""
    @Published var passwordMessage: LocalizedStringKey = ""
    @Published var isFormValid = true
    @Published var presentErrorAlert = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {}
    
    func logIn(completion: @escaping () -> Void) {
        authRepository.logIn(self) { success in
            if (success) {
                completion()
            }
            else {
                self.presentErrorAlert = true
            }
        }
    }
}
