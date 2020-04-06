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
    let author, baseSpirit: String
    let ingredients: [Ingredient]
    let liquor, wineVermouth: String?
}

// MARK: - Ingredient
struct Ingredient: Identifiable, Codable {
    var id : UUID? = UUID()
    let name: String
    let strength: Double
    let measurement: Int
    let measurementUnit: String
}
