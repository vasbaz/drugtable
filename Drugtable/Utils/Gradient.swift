//
//  Gradient.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 25.11.2021.
//

import SwiftUI

extension LinearGradient {
    init(colors: [Color]) {
        self.init(colors: colors, startPoint: .top, endPoint: .bottom)
    }
}
