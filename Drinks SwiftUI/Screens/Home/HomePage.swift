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
    
    @State var showldLoad = true
//    var CarousselCellHeight: Int {
//        if UIDevice.current.model == "iPad" {
//            return 3
//        } else {
//            return 2
//        }
//    }
    
    var body: some View {
        
        
        HStack {
            
            Spacer()
            
            ScrollView (.vertical, showsIndicators: false) {
                
                VStack(spacing: 10) {
                    
                    HStack {
                        
                        
                        Text("Home_Discover".localized())
                            .font(.system(size: 38, weight: .bold, design: .default))
                            .foregroundColor(Color(UIColor.darkTitle))
                            .padding()
                        
                        Spacer()
                        
                    }
                    
                    if viewModel.top5Drinks.isEmpty {
                        
                        VStack () {
                            Spacer()
                            ActivityIndicator(isAnimating: $showldLoad, style: .large)
                            Spacer()
                            
                        }
                    }
                    else {
                        FeaturedDrinksCollectionView(drinks: viewModel.top5Drinks)
                        
                    }
                    
                    if viewModel.categories.isEmpty {
                        VStack () {
                            Spacer()
                            ActivityIndicator(isAnimating: $showldLoad, style: .large)
                            Spacer()
                            
                        }
                    }
                    else {
                        
                        ForEach(viewModel.categories, id: \.self) {
                            category in
                            
                            FeaturedCategory(category: category)
                        }
                    }
                    
                }
            }
        }
    }
}

// MARK: - Collections de drinks em destaque
struct FeaturedCategory: SwiftUI.View {
    var category: Category
    
    var body: some SwiftUI.View {
        VStack {
                HStack {
                    
                    Text(category.name)
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundColor(Color(UIColor.darkTitle))
                        .padding()
                    
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
                
            CollectionView(viewModel: CollecTionViewViewModel(categoryId: category.uid)).frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.topLeading)
        }.padding(.trailing, 10)
    }
}

// MARK: - Carrossel com os drinks em destaque
struct FeaturedDrinksCollectionView: SwiftUI.View {
    var drinks: [Drink]
    
    var body: some SwiftUI.View {
        
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                if !drinks.isEmpty {
                    HStack(spacing: 40) {
                        
                        Spacer().frame(width:20) //Spacer usado para centralizar o carrosel
                        
                        ForEach(drinks, id: \.name) { drink in
                            FeaturedDrink(drink: drink)
                        }
                        
                        Spacer().frame(width:40) //Spacer usado para centralizar o carrosel
                        
                    }
                }
            }
        }//.padding()
    }
}


// MARK: - "Celula de cada drink em destaque usada no carrossel
struct FeaturedDrink: SwiftUI.View {
    
    @State var showingDetail = false
    
    var drink: Drink
    var carousselCellHeight: CGFloat = UIScreen.main.bounds.size.height/4.5
    
    var body: some SwiftUI.View {
        
        Button (action: {
            self.showingDetail.toggle()
        }) {
            VStack {
                URLImage(url: drink.photoUrlSmall, contentMode: .fit)
                    .cornerRadius(10)
                
                Text(drink.name)
                    .font(.system(size: 24, weight: .medium, design: .default))
                    .foregroundColor(Color(UIColor.darkTitle))
                    .offset(y: -20)
                
                Text(drink.strengthString)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.subtitleText))
                    .offset(y: -20)
                
                
            }.frame(width: carousselCellHeight)
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showingDetail) {
            DrinkDetail(drink: self.drink)
            .edgesIgnoringSafeArea(.all)
        }
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
