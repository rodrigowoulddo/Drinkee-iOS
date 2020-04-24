//
//  DrinksFromIngredient.swift
//  Drinks SwiftUI
//
//  Created by Eduardo Ribeiro on 16/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct DrinksFromIngredient: View {
    
    @State var showLoad: Bool = true
    
    @ObservedObject var viewModel: DrinksFromIngredientViewModel
    
    init(viewModel: DrinksFromIngredientViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            
            if viewModel.drinks.isEmpty {

                HStack {
                    
                    Spacer()
                    
                    VStack () {
                        
                        Spacer()
                        ActivityIndicator(isAnimating: $showLoad, style: .large)
                        Spacer()
                        
                    }
                    
                    Spacer()
                }
                
            } else {
                
                ScrollView(showsIndicators: false) {
                    
                    VStack (spacing: 36) {
                        
                        DrinkListTitle(ingredient: viewModel.ingredient)
                        
                        ForEach(viewModel.drinks, id: \.self) {
                            drink in
                            
                            DrinkCell(viewModel: self.viewModel, drink: drink)
                                .frame(height: 144)
                                .cornerRadius(10)
                                .shadow(color: Color(UIColor.shadow), radius: 17)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10).stroke(Color(UIColor.white), lineWidth: 1)
                                )
                        }
                        
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                }
            }
        }
    }
    
    struct DrinkListTitle: View {
        
        let ingredient: Ingredient
        
        var body: some View {
            
                

            Text("DrinksFromIngredient_DrinksWith".localized() + " \(ingredient.name)")
                .font(.system(size: 36))
                .fontWeight(.semibold)
                .foregroundColor(Color(UIColor.black))
                .frame(height: 56)
                
        }
    }
    
    struct DrinkCell: View {
        
        @ObservedObject var viewModel: DrinksFromIngredientViewModel
                
        let drink: Drink
        
        var backgroundColor: Color {
            return Color(UIColor.from(colorNamed: drink.color))
        }
        
        var body: some View {
            
            NavigationLink (destination: DrinkDetail(drink: drink)){
                
                ZStack {
                    
                    RadialGradient(
                        gradient: Gradient(colors: [.white, backgroundColor]),
                        center: .center,
                        startRadius: 1,
                        endRadius: 300
                    )
                    
                    HStack {
                        
                        DrinkCellImage(imageUrl: drink.photoUrlMedium)
                        
                        VStack(alignment: .leading) {
                            DrinkCellContent(name: drink.name, style: drink.style, ingredients: drink.ingredients)
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
                        }
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    struct DrinkCellImage: View {
        
        let imageUrl: String?
        
        var body: some View {
            
            URLImage(url: imageUrl)
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height:144)
                .offset(y: 45)
        }
    }
    
    
    struct DrinkCellContent: View {
        
        let name: String
        let style: String
        let ingredients: [Ingredient]
        
        var body: some View {
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                                                                     
                    Text(name)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(Color(UIColor.darkText))
                    
                    Spacer().frame(height: 2)
        
                    Text(style.capitalized)
                        .font(.system(size: 17, weight: .regular, design: .default))
                        .foregroundColor(Color(UIColor.subtitleText))
                    
                    Spacer().frame(height: 10)
                    
                    Text(ingredients.map{ $0.name }.joined(separator: ", "))
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Color(UIColor.darkText))
                        .lineLimit(1)

                }
                
                Spacer()
            }
        }
    }
    
    // MARK: - Preview
    struct ContentView_Previews: PreviewProvider {
        
        static var previews: some SwiftUI.View {
            
            HStack {
                DrinkList(viewModel: DrinkListViewModel()).frame(width: 215)
                Spacer()
            }
        }
    }
    
}
