//
//  RegisterFormViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import Foundation
import SwiftUI
import Combine
import Resolver

final class RegisterFormViewModel: ObservableObject {
    static let debounceFor = RunLoop.SchedulerTimeType.Stride(0.375)
    static let minPasswordLenght = 8
    
    @Injected var authRepository: AuthRepository
    
    // Inputs
    @Published var email = ""
    @Published var password = ""
    @Published var passwordRepeat = ""
    
    // Outputs
    @Published var emailMessage: LocalizedStringKey = ""
    @Published var passwordMessage: LocalizedStringKey = ""
    @Published var isFormValid = true
    @Published var presentErrorAlert = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    private var isEmailValidPublisher: AnyPublisher<Bool, Never> {
        $email
            .debounce(for: RegisterFormViewModel.debounceFor, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.isValidEmail }
            .eraseToAnyPublisher()
    }
    
    // ToDo: $0.count == 0 ???
    private var passwordLenghtPublisher: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: RegisterFormViewModel.debounceFor, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.count >= RegisterFormViewModel.minPasswordLenght || $0.count == 0 }
            .eraseToAnyPublisher()
    }
    
    // ToDo: $0 == "" || $1 == "" ???
    private var arePasswordsEqualPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($password, $passwordRepeat)
            .debounce(for: RegisterFormViewModel.debounceFor, scheduler: RunLoop.main)
            .map { $0 == $1 || $0 == "" || $1 == "" }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordValidPublisher: AnyPublisher<PasswordValidation, Never> {
        Publishers.CombineLatest(passwordLenghtPublisher, arePasswordsEqualPublisher)
            .map { passwordIsLongEnough, passwordsAreEqual in
                if (!passwordIsLongEnough) {
                    return .notLongEnough
                }
                else if (!passwordsAreEqual) {
                    return .notEqual
                }
                else {
                    return .valid
                }
            }
            .eraseToAnyPublisher()
    }
    
    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isEmailValidPublisher, isPasswordValidPublisher)
            .map { isEmailValid, isPasswordValid in
                isEmailValid && (isPasswordValid == .valid)
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        isEmailValidPublisher
            .receive(on: RunLoop.main)
            .map({isValid in isValid ? "" : LocalizedStringKey("Wrong email format")})
            .assign(to: \.emailMessage, on: self)
            .store(in: &cancellables)
        
        isPasswordValidPublisher
            .receive(on: RunLoop.main)
            .map({ passwordValidation in
                switch passwordValidation {
                case .notLongEnough:
                    return LocalizedStringKey("Password must be at least 8 characters long")
                case .notEqual:
                    return LocalizedStringKey("The repeated password does not match the original")
                case .valid:
                    return ""
                }
            })
            .assign(to: \.passwordMessage, on: self)
            .store(in: &cancellables)
        
        isFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isFormValid, on: self)
            .store(in: &cancellables)
    }
    
    func register(completion: @escaping () -> Void) {
        authRepository.register(self) { success in
            if (success) {
                completion()
            }
            else {
                self.presentErrorAlert = true
            }
        }
    }
}

enum PasswordValidation {
    case notLongEnough
    case notEqual
    case valid
}
