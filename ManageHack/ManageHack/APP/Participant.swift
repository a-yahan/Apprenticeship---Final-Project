//
//  Participant.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/18/25.
//

import Foundation

struct Participant: Identifiable, Codable {
    var id = UUID()
    var name: String
    var email: String
    var points: Int
    var mealCode: String? = nil
    var checkedIn: Bool = false
    var items: [Item]? = nil
    var Events: [Event]? = nil
    var password: String = ""

    // Optional: you can add an explicit initializer like this:
    init(name: String, email: String, points: Int, checkedIn: Bool = false, items: [Item]? = nil, Events: [Event]? = nil, password: String = "") {
        self.id = UUID()
        self.name = name
        self.email = email
        self.points = points
        //self.mealCode = mealCode
        self.checkedIn = checkedIn
        self.items = [Item(type: ItemType.boba, cost: 5), Item(type: ItemType.tshirt, cost: 1), Item(type: ItemType.totebag, cost: 3)]
        self.Events = Events
        self.password = password
    }

    //    private func generateMealCode() -> String{
    //
    //    }
}
