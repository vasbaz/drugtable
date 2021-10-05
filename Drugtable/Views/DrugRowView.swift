//
//  DrugRowView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 05.10.2021.
//

import SwiftUI

struct DrugRowView: View {
    let drug: Drug
    
    var body: some View {
        HStack{
            Text(drug.name)
            Spacer()
            Text(String(drug.id))
        }.padding()
    }
}

struct DrugRowView_Previews: PreviewProvider {
    static var previews: some View {
        DrugRowView(drug: Drug.example)
    }
}
