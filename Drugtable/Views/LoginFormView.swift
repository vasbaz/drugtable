//
//  LoginFormView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 21.10.2021.
//

import SwiftUI

struct LoginFormView: View {
    // ToDo: Research
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var loginFormViewModel = LoginFormViewModel()
    
    var body: some View {
        Form {
            Section {
                TextField(LocalizedStringKey("Login"), text: $loginFormViewModel.login)
                SecureField(LocalizedStringKey("Password"), text: $loginFormViewModel.password)
            }
            Section {
                Button(action: { loginFormViewModel.logIn(completion: {
                    self.presentationMode.wrappedValue.dismiss()
                })}) {
                    Text("Log in")
                }
            }
        }
        .alert(isPresented: $loginFormViewModel.presentErrorAlert) {
            Alert(title: Text("Error"), message: Text("Login failed"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView().previewLayout(.sizeThatFits)
    }
}
