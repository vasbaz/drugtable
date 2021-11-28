//
//  DrugsListPageView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import SwiftUI

struct DrugsListPageView: View {
    let viewModel = DrugsListPageViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach (viewModel.drugs) {
                    drug in DrugRowListPageView(drug: drug)
                }
            }
            HStack{
                Spacer()
                Button(action: {}) {
                    HStack {
                        Text("Add drug")
                        Image(systemName: "plus")
                    }
                    .padding(12.0)
                }
            }
        }
        .navigationBarTitle("My drugs")
    }
}

struct DrugsListPageView_Previews: PreviewProvider {
    static var previews: some View {
        DrugsListPageView()
    }
}
