//
//  Result+decoded.swift
//  Inova
//
//  Created by Lucas on 22/10/19.
//  Copyright © 2019 Homero Oliveira. All rights reserved.
//

import Foundation
import Moya

extension Response {
    func decode<T: Decodable>(_ type: T.Type) -> Result<T, Error> {
        do {
            let decoded = try map(T.self, using: JSONDecoder.persistentDecoder)
            return .success(decoded)
        } catch {
            return .failure(error)
        }
    }
}
