//
//  AuthRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import Firebase

final class AuthRepository {    
    let auth: Auth
    
    init() {
        self.auth = Auth.auth()
    }
    
    func authCompletion(authDataResult: AuthDataResult?, error: Error?) {
        if (error == nil) {
            print(authDataResult!.user.email!)
        }
        else {
            print(error)
        }
    }
    
    func login(_ loginFormViewModel: LoginFormViewModel) {
        auth.signIn(withEmail: loginFormViewModel.login, password: loginFormViewModel.password, completion: authCompletion)
    }
    
    func register(_ registerFormViewModel: RegisterFormViewModel) throws {
        if (registerFormViewModel.password == registerFormViewModel.passwordRepeat) {
            auth.createUser(withEmail: registerFormViewModel.email, password: registerFormViewModel.password, completion: authCompletion)
        }
        else {
            throw AuthError.passwordsEquality
        }
    }
}

enum AuthError: Error {
    case passwordsEquality
}
