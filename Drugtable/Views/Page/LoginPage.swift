//
//  LoginPage.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import SwiftUI

struct LoginPage: View {
    var body: some View {
        LoginFormView().navigationBarTitle("Log in")
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
