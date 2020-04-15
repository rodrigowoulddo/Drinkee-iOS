//
//  UIColor+Extensions.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 13/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

extension UIColor {
    
    // MARK: - Basic Layout
    static let shadow = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
    static let separator = #colorLiteral(red: 0.7725490196, green: 0.7725490196, blue: 0.7725490196, alpha: 1)

    
    // MARK: - Tabbar
    static let tabBarBackground = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.968627451, alpha: 1)
    static let tabBarUnselectedTint = #colorLiteral(red: 0.7529411765, green: 0.7529411765, blue: 0.7529411765, alpha: 1)
    static let tabBarSelectedTint = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
    static let imagePlaceholder = #colorLiteral(red: 0.3215686275, green: 0.3215686275, blue: 0.3215686275, alpha: 1)
    
    
    // MARK: - Drink List
    static let listBackground = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
    
    
    // MARK: - Text
    static let lightText = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let darkText = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let subTitleText = #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)
    static let darkTitle = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)

    
    // MARK: - Methods
    static func from(colorNamed name: String?) -> UIColor {
        
        switch name {
        case "light-burgundy": return #colorLiteral(red: 0.9019607843, green: 0.8196078431, blue: 0.8235294118, alpha: 1)
        case "strong-burgundy": return #colorLiteral(red: 0.9568627451, green: 0.8156862745, blue: 0.8156862745, alpha: 1)
        case "light-yellow": return #colorLiteral(red: 1, green: 0.9725490196, blue: 0.8784313725, alpha: 1)
        case "light-green": return #colorLiteral(red: 0.9254901961, green: 0.9647058824, blue: 0.9411764706, alpha: 1)
        case "soft-red": return #colorLiteral(red: 0.9294117647, green: 0.7215686275, blue: 0.7215686275, alpha: 1)
        case "soft-orange": return #colorLiteral(red: 0.9490196078, green: 0.8470588235, blue: 0.6509803922, alpha: 1)
        default: return .white
        }
        
    }
}

extension Color {
    
    static let shadow = Color((UIColor.shadow))

    
}
