//
//  Category.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 13/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

// MARK: - Category
struct Category: Identifiable, Codable, Hashable {
    var id: UUID? = UUID()
    let uid: String
    let name: String
    
    #if DEBUG
    static let sampleCategory: Category = Category(uid: "abc123", name: "Sample Category")
    #endif
    
}
