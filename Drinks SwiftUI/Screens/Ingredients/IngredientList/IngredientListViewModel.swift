//
//  IngredientListViewModel.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 16/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

class IngredientListViewModel: ObservableObject, Identifiable  {
    
    // MARK: - Observables
    @Published var ingredients: [Ingredient] = []
    @Published var selectedIngredient: Ingredient?
    
    // MARK: - Atributtes
    let service = Service<DrinkEndpoint>()
    
    
    // MARK: - Init
    init() {
        fetchIngredients()
    }
    
    // MARK: - Methods
    func fetchIngredients() {
                
        service.request(.getAllAlchoolicIngredients) {
            (result: Result<[Ingredient], Error>) in

            switch result {
                
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let ingredients):
                self.ingredients = ingredients
            }
        }
    }
}
