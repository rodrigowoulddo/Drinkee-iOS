//
//  IngredientsPage.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 07/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct IngredientsPage: View {
    
    @ObservedObject var viewModel: IngredientListViewModel = IngredientListViewModel()
    
    var body: some View {
        
        HStack {
                
                VStack (spacing: 10) {
                    
                    ForEach(viewModel.ingredients, id: \.self) {
                        ingredient in
                        
                        Text(ingredient.name)
                    }
                    
                }
            
            Spacer()
        }
        
    }
}

struct IngredientsPage_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsPage(viewModel: IngredientListViewModel())
    }
}
