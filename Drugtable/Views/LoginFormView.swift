//
//  LoginFormView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 21.10.2021.
//

import SwiftUI

struct LoginFormView: View {
    @StateObject private var loginFormViewModel = LoginFormViewModel()
    
    var body: some View {
        Form {
            Section {
                TextField(LocalizedStringKey("Login"), text: $loginFormViewModel.login)
                SecureField(LocalizedStringKey("Password"), text: $loginFormViewModel.password)
            }
            Section {
                Button(action: { }) {
                    Text("Log in")
                }
            }
        }
    }
}

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView().previewLayout(.sizeThatFits)
    }
}
