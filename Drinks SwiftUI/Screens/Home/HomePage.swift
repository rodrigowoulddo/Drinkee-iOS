//
//  HomePage.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 07/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    
    var drinks: [Drink] = Drink.sampleDrinks
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 10) {
                    FeaturedDrinksCollectionView(drinks: drinks)
                    Color(.systemPink).frame(height: 250)
                    Color(.systemPink).frame(height: 250)
                    Color(.systemPink).frame(height: 250)
                    Color(.systemPink).frame(height: 250)
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

// MARK: - Carrossel com os drinks em destaque
struct FeaturedDrinksCollectionView: SwiftUI.View {
    var drinks: [Drink]
    
    var body: some SwiftUI.View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 50) {
                ForEach(drinks) { drink in
                    NavigationLink(destination: DrinkDetail(drink: drink)) {
                        FeaturedDrink(drink: drink)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }.padding()
    }
}

// MARK: - "Celula de cada drink em destaque usada no carrossel
struct FeaturedDrink: SwiftUI.View {
    var drink: Drink
    
    var body: some SwiftUI.View {
        VStack {
            //FIXME: - Tirar o ! daqui e substituir por uma imagem placeholder de quando nao conseguir carregar a imagem
            URLImage(url: drink.photoUrlMedium!)
                .cornerRadius(10)
            Text(drink.name)
        }.frame(width: 200, height: 250)
    }
}
