//
//  DrinksFromIngredientViewModel.swift
//  Drinks SwiftUI
//
//  Created by Eduardo Ribeiro on 16/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

class DrinksFromIngredientViewModel: ObservableObject, Identifiable {
    
    // MARK: - Observables
    @Published var drinks: [Drink] = []

    // MARK: - Atributtes
    let service = Service<DrinkEndpoint>()
    let ingredient: Ingredient

    // MARK: - Init
    init(ingredient: Ingredient) {
        self.ingredient = ingredient
        
        //fetchDrinksFromIngredient()
        drinks = [Drink.sampleDrink]
        
    }
    
    // MARK: - Methods
    func fetchDrinksFromIngredient() {
                
        service.request(.getDrinkByAlchoolicIngredient(liquor: ingredient.name, baseSpirit: ingredient.name, wineVermouth: ingredient.name)) {
            (result: Result<[Drink], Error>) in

            switch result {
                
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let drinks):
                self.drinks = drinks
                
            }
        }
    }
}
