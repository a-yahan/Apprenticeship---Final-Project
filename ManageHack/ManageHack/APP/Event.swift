//
//  Event.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/18/25.
//

import Foundation

struct Event: Identifiable, Codable, Equatable{
    var id = UUID()
    var name: String
    var isActive: Bool = false //should be only controlled by host but yeah
    var announcements: String?
    var participants: [Participant]?
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.name == rhs.name
    }

    //FILL!!!
    //var hosts:
}
