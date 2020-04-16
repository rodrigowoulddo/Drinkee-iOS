//
//  AlcohoolicIngredient.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 16/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

// MARK: - AlcohoolicIngredient
struct AlcohoolicIngredient: Identifiable, Codable, Hashable {
    var id: UUID? = UUID()
    let name: String
    let strength: Double
    let color: String?
    let alcoholicType: String
}
