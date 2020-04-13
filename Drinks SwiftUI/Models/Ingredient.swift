//
//  Ingredient.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 13/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

// MARK: - Ingredient
struct Ingredient: Identifiable, Codable, Hashable {
    var id : UUID? = UUID()
    let name: String
    let strength: Double
    let measurement: Int
    let measurementUnit: String
    let color: String?
}
