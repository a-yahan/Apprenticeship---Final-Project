//
//  SingleEventView.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/18/25.
//

import SwiftUI

struct SingleEventView: View {
    var event: Event
    var body: some View {
        Rectangle()
            .fill(event.isActive ? Color.green : Color.gray)
            .frame(width: 300, height: 200)
            .cornerRadius(20)
            .overlay {
                Text(event.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
    }
}

#Preview {
    var sampleEvent = Event(name: "HackNC2025", isActive: true)
    SingleEventView(event: sampleEvent)
}
