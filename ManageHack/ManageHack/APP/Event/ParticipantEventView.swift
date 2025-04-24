//
//  EventView.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/18/25.
//

import SwiftUI

struct ParticipantEventView: View {
    var event: Event
//    var participant: Participant
//    var items: [Item]
    @Bindable var partiVM: ParticipantHomeViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                HStack(alignment: .center, spacing: 20) {
                    Text(event.name)
                        .font(.title)
                    Button {
                        // FILL
                    } label: {
                        Text("CHECK-IN")
                            .font(.title3)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                }
                .padding(.top, 40)
                blackDivider

                ////////////////////////////////////////////////////////////////////////////////////////////////////
                // Maybe do animation
                if let announcements = event.announcements, !announcements.isEmpty {
                    Text(announcements)
                        .font(.headline)
                        .foregroundColor(Color("light"))
                }
                ////////////////////////////////////////////////////////////////////////////////////////////////////
                ///
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: 150, height: 100)
                    .cornerRadius(20)
                    .overlay(
                        Text("\(partiVM.getParticipant().points)")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    )
                HStack {
                    Button {
                        // FILL
                    } label: {
                        ZStack {
                            HStack {
                                Image(systemName: "fork.knife")
                                Text("Meal Code")
                                    .font(.headline)
                            }
                        }
                    }
                    .padding(10)
                    .background(Color(.systemGray6))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    // .foregroundColor(.black)

                    Button {
                        // FILL
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                    }
                }
                ////////////////////////////////////////////////////////////////////////////////////////////////////
                ///
                /// NAVIGATE TO NEW VIEW  SO IT CAN BE RENDERED
                NavigationLink {
                    ItemListView(partiVM: partiVM)
                } label: {
                    Circle()
                        .fill(Color("light"))
                        .padding()
                        .frame(width: 250, height: 250)
                        .overlay(
                            Image(systemName: "tshirt")
                                .foregroundColor(.black)
                                .font(.largeTitle)
                        )
                }
                ///////////////////////////////////////////////////////////////////////////////////////////////////////
                Spacer()
                HStack(alignment: .center, spacing: 50) {
                    NavigationLink {
                        ParticipantHomeView(participant: partiVM.getParticipant())
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Text(partiVM.getParticipant().name)
                        .font(.title)
                    NavigationLink {
                        // FILL
                    } label: {
                        Image(systemName: "questionmark.circle")
                            .font(.title)
                            .foregroundColor(.black)
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

#Preview {
    @Previewable var sampleParticipant = Participant(name: "Angela Yang", email: "ange@gmail.com", points: 4, password: "1234")
    // @Previewable var sampleEvents: [Event] = [Event(name: "HackNC2024"), Event(name: "CDC2023"), Event(name: "PearlHacks2022")]
    @Previewable var sampleCurrentEvent = Event(name: "HackNC2025", isActive: true, announcements: "Lunch is going to be distributed in 30 minutes!")
//    @Previewable var sampleItems = [Item(type: ItemType.boba, cost: 5), Item(type: ItemType.tshirt, cost: 1), Item(type: ItemType.totebag, cost: 3)]

    ParticipantEventView(event: sampleCurrentEvent, partiVM: ParticipantHomeViewModel(participant: Participant(name: "Angela Yang", email: "ange@gmail.com", points: 4, password: "1234")))
}
