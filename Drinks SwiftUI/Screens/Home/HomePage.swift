//
//  HomePage.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 07/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView {
                
                if viewModel.categories.isEmpty {
                    Text("No drinks were found.")
                }
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Discover")
                            .font(.system(.largeTitle))
                            .bold()
                            .padding(.leading)
                        Spacer()
                    }
                    FeaturedDrinksCollectionView(drinks: viewModel.top5Drinks)
                    ForEach(viewModel.categories, id: \.self) {
                        category in
                        
                        FeaturedCategory(category: category)
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
    var category: Category
    
    var body: some SwiftUI.View {
        Group {
            HStack {
                Text(category.name)
                    .font(.system(.largeTitle))
                    .bold()
                    .padding(.leading)
                Spacer()
            }
    //TODO: - "See all" drinks in the category button, uncomment this when we have that screen ready
//            HStack {
//                Spacer()
//                //TODO: - Fazer o request de categorias e ver quantas sao para especificar ao usuario
//                Text("Ver Todos")
//                    //.font(.system(size: 38))
//                    .font(.system(.headline))
//                    .bold()
//                    .padding(.trailing)
//                    .foregroundColor(.gray)
//            }
//            CollectionView(drinks: category.drinks)
            CollectionView(viewModel: CollecTionViewViewModel(categoryId: category.uid)).padding(.bottom, 60)
        }
    }
}

// MARK: - Carrossel com os drinks em destaque
struct FeaturedDrinksCollectionView: SwiftUI.View {
    var drinks: [Drink]

    var body: some SwiftUI.View {
        ScrollView(.horizontal, showsIndicators: false) {
            if !drinks.isEmpty {
                HStack(spacing: 30) {
                    ForEach(drinks, id: \.name) { drink in
                        FeaturedDrink(drink: drink)
                    }
                }
            }
        }
    }
}


// MARK: - "Celula de cada drink em destaque usada no carrossel
struct FeaturedDrink: SwiftUI.View {
    var drink: Drink
    
    var body: some SwiftUI.View {
        NavigationLink(destination: DrinkDetail(drink: drink)) {
            VStack {
                //FIXME: - Tirar o ! daqui e substituir por uma imagem placeholder de quando nao conseguir carregar a imagem
                URLImage(url: drink.photoUrlMedium, contentMode: .fit)
                    .cornerRadius(10)
                Text(drink.name)
            }.frame(width: 200, height: 250)
        }.buttonStyle(PlainButtonStyle())
    }
}
