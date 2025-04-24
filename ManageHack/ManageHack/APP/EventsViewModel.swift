//
//  EventData.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/23/25.
//

import Foundation

@Observable
class EventsViewModel: Codable {
    private var events: [String: Event]?

    init() {
        events = ["HackNC2024": Event(name: "HackNC2024", isActive: true), "CDC2023": Event(name: "CDC2023", isActive: false), "PearlHacks2022": Event(name: "PearlHacks2022", isActive: false)]
    }
    
    func eventExist(name: String) -> Bool{
        return events?[name] != nil
    }
    
    func getEvent(name: String) -> Event{
        return events![name]!
    }
    
    
}
