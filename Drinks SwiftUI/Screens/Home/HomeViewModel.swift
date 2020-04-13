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
    
    // MARK: - Atributtes
    let service = Service<DrinkEndpoint>()
    
    // MARK: - Init
    init() {
    
        #if DEBUG
        configurePreview()
        #endif
        
        fetchCategories()
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
    
    // MARK: - Previews
    func configurePreview() {
        self.categories = [Category.sampleCategory, Category.sampleCategory, Category.sampleCategory]
    }
    
}
