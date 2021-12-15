//
//  RegisterFormViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import Foundation
import Combine

final class RegisterFormViewModel: ObservableObject {
    static let emailRegexp = #"^\S+@\S+\.\S+$"#
    static let debounceTime = 0.5
    
    // Inputs
    @Published var email = ""
    @Published var password = ""
    @Published var passwordRepeat = ""
    
    // Outputs
    @Published var emailMessage = ""
    @Published var passwordMessage = ""
    @Published var isValid = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    private var arePasswordsEqualPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($password, $passwordRepeat)
            .debounce(for: RunLoop.SchedulerTimeType.Stride(RegisterFormViewModel.debounceTime), scheduler: RunLoop.main)
          .map { $0 == $1 }
          .eraseToAnyPublisher()
      }
    
    private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
        $password
          .debounce(for: 0.8, scheduler: RunLoop.main)
          .removeDuplicates()
          .map { password in
            return password == ""
          }
          .eraseToAnyPublisher()
}
}
