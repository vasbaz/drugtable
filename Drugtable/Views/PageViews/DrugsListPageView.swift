//
//  DrugsListPageView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import SwiftUI

struct DrugsListPageView: View {
    @ObservedObject private var viewModel = DrugsListPageViewModel()
    
    @State private var isShowingEditDrugSheet = false
    
    var body: some View {
        VStack {
            List {
                ForEach (viewModel.drugs) {
                    drug in DrugRowListPageView(drug: drug)
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    isShowingEditDrugSheet.toggle()
                }) {
                    HStack {
                        Text("Add drug")
                        Image(systemName: "plus")
                    }
                    .padding(12.0)
                }
            }
        }
        .sheet(isPresented: $isShowingEditDrugSheet) {
            EditDrugView()
        }
        .navigationBarTitle("My drugs")
    }
}

struct DrugsListPageView_Previews: PreviewProvider {
    static var previews: some View {
        DrugsListPageView()
    }
}
