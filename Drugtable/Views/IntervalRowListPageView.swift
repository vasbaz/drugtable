//
//  IntervalRowListPageView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 28.11.2021.
//

import SwiftUI

struct IntervalRowListPageView: View {
    let interval: Interval
    
    var body: some View {
        Text(interval.name)
    }
}

struct IntervalRowListPageView_Previews: PreviewProvider {
    static let intervalMock = IntervalMockProvider().getMock()
    
    static var previews: some View {
        IntervalRowListPageView(interval: intervalMock).previewLayout(.sizeThatFits)
    }
}
