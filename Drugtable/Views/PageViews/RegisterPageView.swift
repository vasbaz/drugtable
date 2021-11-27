//
//  RegisterPage.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 22.10.2021.
//

import SwiftUI

struct RegisterPageView: View {
    var body: some View {
        RegisterFormView().navigationBarTitle("Registration")
    }
}

struct RegisterPageView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPageView()
    }
}
