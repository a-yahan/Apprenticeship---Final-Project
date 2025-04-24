//
//  Items.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/18/25.
//

import Foundation
public enum ItemType: String, Codable {
    case tshirt
    case totebag
    case boba
}

struct Item: Identifiable, Codable {
    var id = UUID()
    var type: ItemType
    var cost: Int
    var obtainable: Bool = false
    var obtained: Bool = false
    
    
}
