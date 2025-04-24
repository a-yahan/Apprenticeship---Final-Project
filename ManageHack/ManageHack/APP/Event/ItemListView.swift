//
//  ItemListView.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/23/25.
//

import SwiftUI

struct ItemListView: View {
    @Bindable var partiVM: ParticipantHomeViewModel
    // @State var itemList: [Item]
    var body: some View {
        VStack {
            Spacer()
            Text("Green: Obtainable\nGrey: Unobtainable")
                .italic()
                .font(.title)
            ScrollView {
                VStack {
                    ForEach(partiVM.getItems()) { item in
                        ItemView(item: item)
                    }
                }
            }.onAppear {
                partiVM.itemStatus()
            }
        }
    }
}

#Preview {
    @Previewable var sampleCurrentEvent = Event(name: "HackNC2025", isActive: true, announcements: "Lunch is going to be distributed in 30 minutes!")

    ItemListView(partiVM: ParticipantHomeViewModel(participant: Participant(name: "Angela Yang", email: "ange@gmail.com", points: 2, password: "1234")))
}
