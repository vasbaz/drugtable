//
//  RegisterFormViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import Foundation

final class RegisterFormViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var passwordRepeat = ""
}
