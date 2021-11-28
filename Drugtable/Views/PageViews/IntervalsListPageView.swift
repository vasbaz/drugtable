//
//  IntervalsListPageView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import SwiftUI

struct IntervalsListPageView: View {
    let viewModel = IntervalsListPageViewModel();
    
    @State private var isShowingEditIntervalSheet = false
    
    var body: some View {
        VStack {
            List {
                ForEach (viewModel.intervals) {
                    interval in IntervalRowListPageView(interval: interval)
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    isShowingEditIntervalSheet.toggle()
                }) {
                    HStack {
                        Text("New interval")
                        Image(systemName: "plus")
                    }
                    .padding(12.0)
                }
            }
        }
        .sheet(isPresented: $isShowingEditIntervalSheet) {
            EditIntervalView()
        }
        .navigationBarTitle("Edit intervals")
    }
}


struct IntervalsListPageView_Previews: PreviewProvider {
    static var previews: some View {
        IntervalsListPageView()
    }
}
