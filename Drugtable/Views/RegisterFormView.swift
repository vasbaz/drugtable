//
//  RegisterFormViewModel.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import SwiftUI

struct RegisterFormView: View {
    // ToDo: Research
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var registerFormViewModel: RegisterFormViewModel = RegisterFormViewModel()
    
    var body: some View {
        Form {
            Section(footer: Text(registerFormViewModel.emailMessage).foregroundColor(.red)) {
                TextField(LocalizedStringKey("Email address"), text: $registerFormViewModel.email)
            }
            Section(footer: Text(registerFormViewModel.passwordMessage).foregroundColor(.red)) {
                SecureField(LocalizedStringKey("Password"), text: $registerFormViewModel.password)
                SecureField(LocalizedStringKey("Password repeat"), text: $registerFormViewModel.passwordRepeat)
            }
            Section {
                Button(action: { registerFormViewModel.register(completion: {
                    self.presentationMode.wrappedValue.dismiss()
                })}) {
                    Text("Register")
                }
            }
        }
        .alert(isPresented: $registerFormViewModel.presentErrorAlert) {
            Alert(title: Text("Error"), message: Text("Registration failed"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct RegisterFormView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterFormView().previewLayout(.sizeThatFits)
    }
}
