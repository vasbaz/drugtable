//
//  RemindersGroupView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 06.10.2021.
//

import SwiftUI

struct RemindersGroupView: View {
    let viewModel: RemindersGroupViewModel
    
    @ViewBuilder func resolveBackground(theme: IntervalTheme?) -> some View {
        switch theme {
        case .warmOrange:
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .top, endPoint: .bottom)
        default:
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.interval.name).font(.title)
            ForEach (viewModel.reminders) {
                reminder in ReminderRowView(reminder: reminder)
            }
        }.padding(12.0).background(resolveBackground(theme: viewModel.interval.theme)).cornerRadius(12)
    }
}

struct RemindersGroupView_Previews: PreviewProvider {
    static let remindersGroupViewMock = RemindersGroupViewMockProvider().getMock()
    
    static var previews: some View {
        RemindersGroupView(viewModel: remindersGroupViewMock)
    }
}
