//
//  Drink.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 01/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

// MARK: - Drink
struct Drink: Identifiable, Codable {
    var id : UUID? = UUID()
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
    
    /// Photos
    let photoUrlSmall: String?
    let photoUrlMedium: String?
    let photoUrlLarge: String?

    
    #if DEBUG
    static let sampleDrinks: [Drink] = [
        Drink(numberOfRatingVotes: 10, name: "Mock Drink", strength: 8.1, style: "Party", rating: 6.1, author: "Didico", baseSpirit: nil, liquor: "Aperol", wineVermouth: nil, ingredients: [Ingredient(name: "Aperol", strength: 6.7, measurement: 4, measurementUnit: "ml", color: "blue")], steps: ["Step 1", "Step 2"], photoUrlSmall: "https://vilavinifera.files.wordpress.com/2016/10/orange-juice-410333_960_720.jpg?w=940", photoUrlMedium: "https://vilavinifera.files.wordpress.com/2016/10/orange-juice-410333_960_720.jpg?w=940", photoUrlLarge: nil),
        Drink(numberOfRatingVotes: 10, name: "Mock Drink", strength: 8.1, style: "Party", rating: 6.1, author: "Didico", baseSpirit: nil, liquor: "Aperol", wineVermouth: nil, ingredients: [Ingredient(name: "Aperol", strength: 6.7, measurement: 4, measurementUnit: "ml", color: "blue")], steps: ["Step 1", "Step 2"], photoUrlSmall: "https://vilavinifera.files.wordpress.com/2016/10/orange-juice-410333_960_720.jpg?w=940", photoUrlMedium: "https://vilavinifera.files.wordpress.com/2016/10/orange-juice-410333_960_720.jpg?w=940", photoUrlLarge: nil),
        Drink(numberOfRatingVotes: 10, name: "Mock Drink", strength: 8.1, style: "Party", rating: 6.1, author: "Didico", baseSpirit: nil, liquor: "Aperol", wineVermouth: nil, ingredients: [Ingredient(name: "Aperol", strength: 6.7, measurement: 4, measurementUnit: "ml", color: "blue")], steps: ["Step 1", "Step 2"], photoUrlSmall: "https://vilavinifera.files.wordpress.com/2016/10/orange-juice-410333_960_720.jpg?w=940", photoUrlMedium: "https://vilavinifera.files.wordpress.com/2016/10/orange-juice-410333_960_720.jpg?w=940", photoUrlLarge: nil),
        Drink(numberOfRatingVotes: 10, name: "Mock Drink", strength: 8.1, style: "Party", rating: 6.1, author: "Didico", baseSpirit: nil, liquor: "Aperol", wineVermouth: nil, ingredients: [Ingredient(name: "Aperol", strength: 6.7, measurement: 4, measurementUnit: "ml", color: "blue")], steps: ["Step 1", "Step 2"], photoUrlSmall: "https://vilavinifera.files.wordpress.com/2016/10/orange-juice-410333_960_720.jpg?w=940", photoUrlMedium: "https://vilavinifera.files.wordpress.com/2016/10/orange-juice-410333_960_720.jpg?w=940", photoUrlLarge: nil)
    ]
    #endif

}

// MARK: - Ingredient
struct Ingredient: Identifiable, Codable {
    var id : UUID? = UUID()
    let name: String
    let strength: Double
    let measurement: Int
    let measurementUnit: String
    let color: String?
}
