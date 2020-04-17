//
//  HomeViewModel.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 13/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

class HomeViewModel: ObservableObject, Identifiable {
    
    // MARK: - Observables
    @Published var categories: [Category] = []
    @Published var top5Drinks: [Drink] = []
    
    // MARK: - Atributtes
    let service = Service<DrinkEndpoint>()
    
    // MARK: - Init
    init() {
    
        #if DEBUG
        configurePreview()
        #endif
        
        fetchCategories()
        fetchTop5Drinks()
    }
    
    
    // MARK: - Methods
    func fetchCategories() {
        
        service.request(.getAllCategories) {
            (result: Result<[Category], Error>) in

            switch result {
                
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let categories):
                self.categories = categories
                
                /// Debug
                print(self.categories)
                ///
            }
            
        }
        
    }
    
    func fetchTop5Drinks() {
        
        service.request(.getTopNDrinks(numberOfDrinks: 5)) {
            (result: Result<[Drink], Error>) in

            switch result {
                
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let topDrinks):
                self.top5Drinks = topDrinks
                
                /// Debug
                print(self.top5Drinks)
                ///
            }
            
        }
        
    }
    
    // MARK: - Previews
    func configurePreview() {
        self.categories = Array(repeating: .sampleCategory, count: 3)
    }
    
}
