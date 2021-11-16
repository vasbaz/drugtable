//
//  RegisterFormViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import Foundation

final class RegisterFormViewModel: ObservableObject {
    @Published var email: String
    @Published var password: String
    @Published var passwordRepeat: String
    
    init(email: String = "", password: String = "", passwordRepeat: String = "") {
        self.email = email
        self.password = password
        self.passwordRepeat = passwordRepeat
    }
}
