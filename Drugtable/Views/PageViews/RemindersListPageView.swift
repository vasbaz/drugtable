//
//  RemindersListPageView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

import SwiftUI

struct RemindersListPageView: View {
    let viewModel = RemindersListPageViewModel();
    
    @State private var isShowingEditReminderSheet = false
    
    var body: some View {
        VStack {
            List {
                ForEach (viewModel.reminderViewModels) {
                    reminderViewModel in ReminderRowListPageView(viewModel: reminderViewModel)
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    isShowingEditReminderSheet.toggle()
                }) {
                    HStack {
                        Text("Add reminder")
                        Image(systemName: "plus")
                    }
                    .padding(12.0)
                }
            }
        }
        .sheet(isPresented: $isShowingEditReminderSheet) {
            EditReminderView()
        }
        .navigationBarTitle("Edit reminders")
    }
}

struct RemindersListPageView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersListPageView()
    }
}
