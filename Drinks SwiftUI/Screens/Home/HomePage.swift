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
                    FeaturedCategory(drinks: drinks, categoryName: "Clássicos")
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

// MARK: - Collections de drinks em destaque
struct FeaturedCategory: SwiftUI.View {
    var drinks: [Drink]
    var categoryName: String
    
    var body: some SwiftUI.View {
        VStack{
            HStack {
                Text(categoryName)
                    .font(.system(size: 38))
                    .bold()
                    .padding(.leading, 39)
                Spacer()
            }
            Text("ANTES")
            ForEach(drinks) { drink in
                categoryCell(drink: drink)
            }
            Text("DEPOIS")
        }
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

// MARK: - Drink Category Cell
struct categoryCell: SwiftUI.View {
    var drink: Drink
    
    var body: some SwiftUI.View {
        VStack {
            Text("Here we go")
            Text(drink.name)
        }
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
