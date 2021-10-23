//
//  LoginFormViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 21.10.2021.
//

import Foundation

class LoginFormViewModel: ObservableObject {
    @Published var login: String
    @Published var password: String
    
    init(login: String = "", password: String = "") {
        self.login = login
        self.password = password
    }
}
