//
//  HomeView.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/18/25.
//

import SwiftUI

struct ParticipantHomeView: View {
    var participant: Participant
    @State private var partihomeVM: ParticipantHomeViewModel
    //@State var Events: [Event] = partihomeVM.getEvents()
    init(participant: Participant) {
        self.participant = participant
        _partihomeVM = State(initialValue: ParticipantHomeViewModel(participant: participant))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 30) {
                    Text(partihomeVM.getParticipant().name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 55))
                }
                blackDivider
                ScrollView() {
                    VStack(alignment: .center) {
                        var Events: [Event] = partihomeVM.getEvents()
                        ForEach(Events) { event in
                            NavigationLink {
                                ParticipantEventView(event: event, partiVM: partihomeVM)
                            } label: {
                                SingleEventView(event: event)
                            }
                        }
                        .padding(30)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
//                        NavigationLink {
//                            // FILL
//                        } label: {
//                            Image(systemName: "plus.circle")
//                                .font(.title)
//                                .foregroundColor(.black)
//                        }
                        Spacer()
                        NavigationLink {
                            SearchEventView(particpantVM:partihomeVM)
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var blackDivider: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(height: 1)
    }
}

let sampleEvents: [Event] = [Event(name: "HackNC2024", isActive: true), Event(name: "CDC2023"), Event(name: "PearlHacks2022")]
let sampleParticipant = Participant(name: "Angela Yang", email: "ange@gmail.com", points: 3, Events: sampleEvents, password:"1234")

#Preview {
    //@Previewable var sampleCurrentEvent = Event(name: "HackNC2025", isActive: true)

     //@Previewable @Previewable @State var samplePartihomeVM = ParticipantHomeViewModel()

    ParticipantHomeView(participant: sampleParticipant)
}
