//
//  CollecTionViewViewModel.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 15/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation


class CollecTionViewViewModel: ObservableObject, Identifiable {
    
    // MARK: - Observables
    @Published var drinks: [Drink] = []
    
    
    // MARK: - Atributtes
    let categoryId: String
    let service = Service<DrinkEndpoint>()
    
    
    // MARK: - Init
    init(categoryId: String) {
        
        self.categoryId = categoryId
        
        #if DEBUG
        configurePreview()
        #endif
        
        fetchDrinks()
    }
    
    // MARK: - Methods
    func fetchDrinks() {
                
        service.request(.getDrinksByCategoryId(self.categoryId)) {
            (result: Result<[Drink], Error>) in

            switch result {
                
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let drinks):
                self.drinks = drinks
                
            }
        }
    }
    
    // MARK: - Previews
    func configurePreview() {
        self.drinks = Drink.sampleDrinks
    }
}
