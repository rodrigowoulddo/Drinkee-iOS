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
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView {
                
                if viewModel.categories.isEmpty {
                    Text("No drinks were found.")
                }
                
                VStack(spacing: 10) {
                    FeaturedDrinksCollectionView(drinks: drinks)
                    ForEach(viewModel.categories, id: \.self) {
                        category in
                        
                        FeaturedCategory(drinks: category.drinks, categoryName: category.name)
                    }
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
        Group {
            HStack {
                Text(categoryName)
                    //.font(.system(size: 38))
                    .font(.system(.largeTitle))
                    .bold()
                    .padding(.leading)
                Spacer()
            }
            HStack {
                Spacer()
                //TODO: - Fazer o request de categorias e ver quantas sao para especificar ao usuario
                Text("Ver Todos")
                    //.font(.system(size: 38))
                    .font(.system(.headline))
                    .bold()
                    .padding(.trailing)
                    .foregroundColor(.gray)
            }
            CollectionView()
        }
    }
}

// MARK: - Carrossel com os drinks em destaque
struct FeaturedDrinksCollectionView: SwiftUI.View {
    var drinks: [Drink]
    
    var body: some SwiftUI.View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(drinks) { drink in
                    NavigationLink(destination: DrinkDetail(drink: drink)) {
                        FeaturedDrink(drink: drink)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
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
