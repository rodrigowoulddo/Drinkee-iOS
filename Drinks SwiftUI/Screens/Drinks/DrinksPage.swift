//
//  DrinksPage.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 07/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct DrinksPage: View {
    
    @ObservedObject var drinkListViewModel = DrinkListViewModel()
    
    var body: some View {
        
        HStack {
            DrinkList(viewModel: drinkListViewModel).frame(width: 215)
            DrinkDetail(drink: drinkListViewModel.selectedDrink)
        }
        
    }
}

struct DrinksPage_Previews: PreviewProvider {
    static var previews: some View {
        DrinksPage()
    }
}
