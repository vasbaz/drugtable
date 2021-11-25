//
//  MainPageRemindersGroupView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 06.10.2021.
//

import SwiftUI

struct MainPageRemindersGroupView: View {
    let viewModel: RemindersGroupViewModel
    
    @ViewBuilder func resolveBackground(theme: IntervalTheme?) -> some View {
        switch theme {
        case .morning:
            LinearGradient(colors: [Color("Morning"), Color("DayIPart")])
        case .dayIPart:
            LinearGradient(colors: [Color("DayIPart"), Color("DayIIPart")])
        case .dayIIPart:
            LinearGradient(colors: [Color("DayIIPart"), Color("Evening")])
        case .evening:
            LinearGradient(colors: [Color("Evening"), Color("Night")])
        case .night:
            LinearGradient(colors: [Color("Night"), Color("Morning")])
        default:
            // ToDo: Default color
            LinearGradient(colors: [Color("Morning"), Color("DayIPart")])
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.interval.name)
                .font(.title)
            ForEach (viewModel.reminderViewModels) {
                reminderViewModel in MainPageReminderRowView(viewModel: reminderViewModel)
            }
        }.padding(12.0).background(resolveBackground(theme: viewModel.interval.theme)).cornerRadius(12)
    }
}

//struct RemindersGroupView_Previews: PreviewProvider {
//    static let remindersGroupViewMock = RemindersGroupViewMockProvider().getMock()
//    
//    static var previews: some View {
//        MainPageRemindersGroupView(viewModel: remindersGroupViewMock)
//    }
//}
