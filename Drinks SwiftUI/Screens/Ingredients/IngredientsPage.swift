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
                IngredientList(viewModel: viewModel)
        }
        
    }
}

struct IngredientsPage_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsPage(viewModel: IngredientListViewModel())
    }
}
