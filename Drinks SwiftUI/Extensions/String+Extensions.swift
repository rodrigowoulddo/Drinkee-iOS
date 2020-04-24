//
//  String+Extensions.swift
//  Drinks SwiftUI
//
//  Created by Rafael Ferreira on 24/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String{
        return NSLocalizedString(self, comment: "")
    }
}
