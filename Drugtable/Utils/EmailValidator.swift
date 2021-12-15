//
//  EmailValidator.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 15.12.2021.
//

import Foundation

extension String {
    static let emailRegexp = #"^\S+@\S+\.\S+$"#
    
    var isValidEmail: Bool {
        get {
            if (self == "") {
                return true
            }
            
            let regex = try! NSRegularExpression(pattern: .emailRegexp, options: .caseInsensitive)
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        }
        
    }
}
