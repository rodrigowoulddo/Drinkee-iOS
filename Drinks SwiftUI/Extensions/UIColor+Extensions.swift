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
    
    static func named(_ name: String) -> UIColor {
        return UIColor(named: name) ?? UIColor.white
    }
    
    // MARK: - Basic Layout
    static let shadow = UIColor.named("Shadow")
    static let separator = UIColor.named("Separator")
    static let background = UIColor.named("Background")

    
    // MARK: - Tabbar
    static let tabBarBackground = UIColor.named("Tab Bar Background")
    static let tabBarUnselectedTint = UIColor.named("Tab Bar Unselected Tint")
    static let tabBarSelectedTint = UIColor.named("Tab Bar Selected Tint")
    static let imagePlaceholder = UIColor.named("Image Placeholder")
    
    
    // MARK: - Drink List
    static let listBackground = UIColor.named("List Background")
    
    
    // MARK: - Text
    static let lightText = UIColor.named("Light Text")
    static let darkText = UIColor.named("Dark Text")
    static let allwaysDarkText = UIColor.named("Allways Dark Text")
    static let subtitleText = UIColor.named("Subtitle Text")
    static let darkTitle = UIColor.named("Dark Title")
    static let yellowText = UIColor.named("Yellow Text")

    
    // MARK: - Methods
    static func from(colorNamed name: String?) -> UIColor {
        
        switch name {
        case "light-burgundy": return #colorLiteral(red: 0.9019607843, green: 0.8196078431, blue: 0.8235294118, alpha: 1)
        case "strong-burgundy": return #colorLiteral(red: 0.9568627451, green: 0.8156862745, blue: 0.8156862745, alpha: 1)
        case "light-yellow": return #colorLiteral(red: 1, green: 0.9725490196, blue: 0.8784313725, alpha: 1)
        case "soft-yellow": return #colorLiteral(red: 0.9882352941, green: 0.9725490196, blue: 0.9176470588, alpha: 1)
        case "light-green": return #colorLiteral(red: 0.9254901961, green: 0.9647058824, blue: 0.9411764706, alpha: 1)
        case "soft-red": return #colorLiteral(red: 0.9294117647, green: 0.7215686275, blue: 0.7215686275, alpha: 1)
        case "soft-orange": return #colorLiteral(red: 1, green: 0.9058823529, blue: 0.7647058824, alpha: 1)
        case "gray": return #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
        case "orange": return #colorLiteral(red: 1, green: 0.9137254902, blue: 0.8470588235, alpha: 1)
        case "green": return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        case "brown": return #colorLiteral(red: 0.7176470588, green: 0.5921568627, blue: 0.5215686275, alpha: 1)
        case "light-gray": return #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        case "red": return #colorLiteral(red: 1, green: 0.8588235294, blue: 0.8509803922, alpha: 1)
        case "gold": return #colorLiteral(red: 0.9647058824, green: 0.9490196078, blue: 0.8509803922, alpha: 1)
        default: return .white
        }
        
    }
}
