//
//  AddEventView.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/23/25.
//

import SwiftUI

struct SearchEventView: View {
    @State private var searchEvent = ""
    @State private var eventsVM = EventsViewModel()
    @Bindable var particpantVM: ParticipantHomeViewModel
    @State private var eventNoExist: String? = nil // default to true to hide warning initially

    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter Event Name", text: $searchEvent)
                    .onSubmit {
                        if eventsVM.eventExist(name: searchEvent) {
                            let newEvent = eventsVM.getEvent(name: searchEvent)
                            particpantVM.addEvent(newEvent)
                        } else {
                            eventNoExist = "Event Does Not Exist!"
                        }
                    }
            }
            .navigationTitle("Search for an event")
            .overlay(
                VStack {
                    Button() {
                        if eventsVM.eventExist(name: searchEvent) {
                            let newEvent = eventsVM.getEvent(name: searchEvent)
                            particpantVM.addEvent(newEvent)
                            eventNoExist = "Event Added!"
                            searchEvent = ""
                        } else {
                            eventNoExist = "Event Does Not Exist!"
                        }
                    } label: {
                        Text("Add Event")
                    }.buttonStyle(.borderedProminent)
                    Text(eventNoExist ?? "MEOW")
                        .foregroundColor(.red)
                        .padding(.bottom, 500)
                }
            )
        }
    }
}

#Preview {
    SearchEventView(particpantVM: ParticipantHomeViewModel(participant: Participant(name: "Angela Yang", email: "ange@gmail.com", points: 4, password: "1234")))
}
