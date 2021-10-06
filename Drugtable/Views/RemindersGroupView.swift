//
//  RemindersGroupView.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 06.10.2021.
//

import SwiftUI

struct RemindersGroupView: View {
    let reminders: [Reminder]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RemindersGroupView_Previews: PreviewProvider {
    static var previews: some View {
        let reminders = RemindersArrayMockProvider().getMock()
        RemindersGroupView(reminders: reminders)
    }
}
