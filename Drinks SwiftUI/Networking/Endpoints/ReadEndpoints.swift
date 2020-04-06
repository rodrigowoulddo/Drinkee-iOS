//
//  ReadEndpoints.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 03/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation
import Moya


enum DrinkEndpoint {
    
    case getDrinkByName(String)
    case getDrinkByAlchoolicIngredient(liquor: String?, baseSpirit: String?)

}

extension DrinkEndpoint: TargetType {
    
    var path: String {
        
        switch self {
            case .getDrinkByName(let name): return "/drink/\(name)"
            case .getDrinkByAlchoolicIngredient: return "/drink/ingredient/alcoholic"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            case .getDrinkByName: return .get
            case .getDrinkByAlchoolicIngredient: return .get
        }
    }
    
    var task: Task {
        
        switch self {
            
        case .getDrinkByName:
            return .requestPlain
            
        case .getDrinkByAlchoolicIngredient(let liquor, let baseSpirit):
            let params = makeParamsDictionary(["liquor": liquor, "baseSpirit": baseSpirit])
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
            
        }
    }
    
    
    
    
}
