//
//  Drink.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 01/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

// MARK: - Drink
struct Drink: Identifiable, Codable, Hashable {
    var id: UUID? = UUID()
    let numberOfRatingVotes: Int
    let name: String
    let strength: Double
    let style: String
    let rating: Double
    let author: String
    let baseSpirit: String?
    let liquor: String?
    let wineVermouth: String?
    let ingredients: [Ingredient]
    let steps: [String]
    let color: String?
    
    /// Photos
    let photoUrlSmall: String?
    let photoUrlMedium: String?
    let photoUrlLarge: String?

    
    #if DEBUG

    static let sampleDrink: Drink =
        Drink(
            numberOfRatingVotes: 10,
            name: "Mock Drink",
            strength: 0.11,
            style: "Party",
            rating: 6.1,
            author: "Didico",
            baseSpirit: nil,
            liquor: "Aperol",
            wineVermouth: nil,
            ingredients:
                [
                    Ingredient(
                        name: "Aperol",
                        strength: 6.7,
                        measurement: 4,
                        measurementUnit: "ml",
                        color: "soft-red"
                    )
                ],
            steps:
                [
                    "Step 1",
                    "Step 2"
                ],
            color: "light-green",
            photoUrlSmall: "https://rodrigowoulddo.github.io/DrinKeeImages/blood-mary/small.png",
            photoUrlMedium: "https://rodrigowoulddo.github.io/DrinKeeImages/blood-mary/medium.png",
            photoUrlLarge: "https://rodrigowoulddo.github.io/DrinKeeImages/blood-mary/large.png"
        )
    
    static let sampleDrinks: [Drink] = Array(repeating: sampleDrink, count: 5)

    #endif

}
