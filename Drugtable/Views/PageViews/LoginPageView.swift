//
//  LoginPage.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import SwiftUI

struct LoginPageView: View {
    var body: some View {
        LoginFormView().navigationBarTitle("Log in | noun")
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
