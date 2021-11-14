//
//  RegisterPage.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import SwiftUI

struct RegisterPage: View {
    var body: some View {
        RegisterFormView().navigationBarTitle("Register")
    }
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
