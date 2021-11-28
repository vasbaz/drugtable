//
//  DrugRowListPageView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 28.11.2021.
//

import SwiftUI

struct DrugRowListPageView: View {
    let drug: Drug
    
    var body: some View {
        Text(drug.name)
    }
}

struct DrugRowListPageView_Previews: PreviewProvider {
    static let drugMock = DrugMockProvider().getMock()
    
    static var previews: some View {
        DrugRowListPageView(drug: drugMock).previewLayout(.sizeThatFits)
    }
}
