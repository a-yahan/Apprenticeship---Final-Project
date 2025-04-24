//
//  ItemView.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/21/25.
//

import SwiftUI

struct ItemView: View {
    var item: Item
    var body: some View {
        getCircle(item: item)
    }
}

@ViewBuilder
func getImage(item: Item) -> some View {
    switch item.type {
    case .tshirt:
        Image(systemName: "tshirt")
            .font(.largeTitle)
    case .totebag:
        Image(systemName: "bag")
            .font(.largeTitle)
    case .boba:
        Image(systemName: "mug")
            .font(.largeTitle)
    }
}

@ViewBuilder
func getCircle(item: Item) -> some View {
    if item.obtained {
        Circle()
            .fill(Color.purple)
            .padding()
            .frame(width: 250, height: 250)
            .overlay(
                getImage(item: item)
            )
    } else if item.obtainable {
        Circle()
            .fill(Color.green)
            .padding()
            .frame(width: 250, height: 250)
            .overlay(
                getImage(item: item)
            )
    } else if !item.obtainable {
        Circle()
            .fill(Color.secondary)
            .padding()
            .frame(width: 250, height: 250)
            .overlay(
                getImage(item: item)
            )
    }
}

#Preview {
    @Previewable var sampleItem = Item(type: ItemType.tshirt, cost: 5)
    ItemView(item: sampleItem)
}
