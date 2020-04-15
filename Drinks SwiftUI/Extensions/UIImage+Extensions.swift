//
//  UIImage+Extensions.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 13/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    static func withAsset(named assetName: String) -> UIImage {
        
        if let image = UIImage(named: assetName) { return image }
        else { return UIImage(systemName: "xmark.circle.fill")! }
        
    }
}
