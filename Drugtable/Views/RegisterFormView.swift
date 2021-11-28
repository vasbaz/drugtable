//
//  RegisterFormViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import SwiftUI

struct RegisterFormView: View {
    @StateObject private var registerFormViewModel: RegisterFormViewModel = RegisterFormViewModel()
    
    var body: some View {
        Form {
            Section {
                TextField(LocalizedStringKey("Email address"), text: $registerFormViewModel.email)
            }
            Section {
                SecureField(LocalizedStringKey("Password"), text: $registerFormViewModel.password)
                SecureField(LocalizedStringKey("Password repeat"), text: $registerFormViewModel.passwordRepeat)
            }
            Section {
                Button(action: { }) {
                    Text("Register")
                }
            }
        }
    }
}

struct RegisterFormView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterFormView().previewLayout(.sizeThatFits)
    }
}
