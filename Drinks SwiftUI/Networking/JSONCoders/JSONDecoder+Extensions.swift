//
//  JSONDecoder+Extensions.swift
//  Inova
//
//  Created by Lucas on 22/10/19.
//  Copyright © 2019 Homero Oliveira. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.defaultFormatter)
        return decoder
    }()
    
    static let persistentDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            var dateString = try container.decode(String.self)
            dateString = dateString.replacingOccurrences(of: "\\.\\d+Z", with: "", options: .regularExpression)
            
            if let date = DateFormatter.defaultFormatter.date(from: dateString) {
                return date
            }
            
            if let date = DateFormatter.iso8601.date(from: dateString) {
                return date
            }
            
            throw DecodingError.dataCorruptedError(in: container,
                debugDescription: "Cannot decode date string \(dateString)")
        }
        return decoder
    }()
}
