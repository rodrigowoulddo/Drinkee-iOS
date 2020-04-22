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
    
    case getAllDrinks(Language)
    case getDrinkByName(String)
    case getDrinkByAlchoolicIngredient(liquor: String?, baseSpirit: String?, wineVermouth: String?)
    case getAllCategories
    case getDrinksByCategoryId(String)
    case getAllAlchoolicIngredients
    case getTopNDrinks(numberOfDrinks: Int)
}

extension DrinkEndpoint: TargetType {
    
    var path: String {
        
        switch self {
            case .getAllDrinks: return "/drink/all"
            case .getDrinkByName(let name): return "/drink/\(name)"
            case .getDrinkByAlchoolicIngredient: return "/drink/ingredient/alcoholic"
            case .getAllCategories: return "/category/all"
            case .getDrinksByCategoryId(let id): return "/category/\(id)/drinks"
            case .getAllAlchoolicIngredients: return "/ingredient/alcoholic/all"
            case .getTopNDrinks: return "/drink/top"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            case .getAllDrinks: return .get
            case .getDrinkByName: return .get
            case .getDrinkByAlchoolicIngredient: return .get
            case .getAllCategories: return .get
            case .getDrinksByCategoryId: return .get
            case .getAllAlchoolicIngredients: return .get
            case .getTopNDrinks: return .get
        }
    }
    
    var task: Task {
        
        switch self {
        
        case .getAllDrinks(let language):
            let params = makeParamsDictionary(["language": language])
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)

        case .getDrinkByName:
            return .requestPlain
            
        case .getDrinkByAlchoolicIngredient(let liquor, let baseSpirit, let wineVermouth ):
            let params = makeParamsDictionary(["liquor": liquor, "baseSpirit": baseSpirit, "wineVermouth": wineVermouth])
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
            
        case .getAllCategories:
            return .requestPlain
            
        case .getDrinksByCategoryId:
            return .requestPlain
            
        case .getAllAlchoolicIngredients:
            return .requestPlain
            
        case .getTopNDrinks(let numberOfDrinks):
            let params = makeParamsDictionary(["numberOfDrinks": numberOfDrinks])
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
            
        }
    }
}
