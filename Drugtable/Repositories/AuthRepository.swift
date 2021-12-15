//
//  AuthRepository.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import Firebase

final class AuthRepository {    
    let auth: Auth = Auth.auth()
    
    @Published var user: User?
    
    func authCompletionResolver(completion: @escaping (Bool) -> Void) -> (AuthDataResult?, Error?) -> Void {
        return { (authDataResult: AuthDataResult?, error: Error?) in
            if (error == nil) {
                self.user = authDataResult?.user
                completion(true)
            }
            else {
                print(error)
                completion(false)
            }
        }
    }
    
    
    func logIn(_ loginFormViewModel: LoginFormViewModel, completion: @escaping (Bool) -> Void) {
        auth.signIn(withEmail: loginFormViewModel.login, password: loginFormViewModel.password, completion: authCompletionResolver(completion: completion))
    }
    
    func register(_ registerFormViewModel: RegisterFormViewModel, completion: @escaping (Bool) -> Void) {
        auth.createUser(withEmail: registerFormViewModel.email, password: registerFormViewModel.password, completion: authCompletionResolver(completion: completion))
    }
    
    func logOut() {
        do {
            try auth.signOut()
            self.user = nil
        }
        catch {
            print("logout error")
        }
    }
}
