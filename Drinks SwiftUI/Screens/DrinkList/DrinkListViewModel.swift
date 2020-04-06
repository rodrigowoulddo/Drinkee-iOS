//
//  DrinkListViewModel.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 03/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

class DrinkListViewModel: ObservableObject, Identifiable {
    
    // MARK: - Observables
    @Published var drinks: [Drink] = []
    
    // MARK: - Atributtes
    let service = Service<DrinkEndpoint>()

    // MARK: - Init
    init() {
        
        fetchDrinks()
    }
    
    // MARK: - Methods
    func fetchDrinks() {
                
        service.request(.getDrinkByAlchoolicIngredient(liquor: "Aperol", baseSpirit: "Gin")) {
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
