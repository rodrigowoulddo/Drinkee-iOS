//
//  JSONEncoder+Extensions.swift
//  Inova
//
//  Created by Lucas on 22/10/19.
//  Copyright © 2019 Homero Oliveira. All rights reserved.
//

import Foundation

extension JSONEncoder {
    static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(DateFormatter.defaultFormatter)
        return encoder
    }()
}
