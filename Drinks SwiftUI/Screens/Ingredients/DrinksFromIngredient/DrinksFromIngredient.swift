//
//  DrinksFromIngredient.swift
//  Drinks SwiftUI
//
//  Created by Eduardo Ribeiro on 16/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct DrinksFromIngredient: View {
    
    @ObservedObject var viewModel: DrinksFromIngredientViewModel
    
    init(viewModel: DrinksFromIngredientViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            
            if viewModel.drinks.isEmpty {
                VStack (alignment: .center) {
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Image(systemName: "wifi.slash")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.white)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                }
            } else {
                
                ScrollView {
                    
                    VStack (spacing: 36) {
                        
                        DrinkListTitle(ingredient: viewModel.ingredient)
                        
                        ForEach(viewModel.drinks, id: \.self) {
                            drink in
                            DrinkCell(viewModel: self.viewModel, drink: drink)
                                .frame(width: 825, height: 144)
                                .clipped()
                        }
                    }
                }
            }
            
        }
    }
    
    struct DrinkListTitle: View {
        
        let ingredient: Ingredient
        
        var body: some View {
            
                
            Text("Drinks with \(ingredient.name)")
                .font(.system(size: 38))
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
            
            ZStack {
                
                RadialGradient(
                    gradient: Gradient(colors: [.white, backgroundColor]),
                    center: .center,
                    startRadius: 1,
                    endRadius: 125
                )
                
                VStack {
                    Spacer()
                    DrinkCellImage(imageUrl: drink.photoUrlMedium)
                }
                
                VStack(alignment: .leading) {
                    Spacer().frame(height: 8)
                    DrinkCellTitle(name: drink.name, style: drink.style)
                    Spacer()
                }
                
            }

        }
    }
    
    struct DrinkCellImage: View {
        
        let imageUrl: String?
        
        var body: some View {
            
            URLImage(url: imageUrl)
                .scaleEffect(0.2)
                .aspectRatio(contentMode: .fill)
                .offset(x: -300, y: 50)
        }
    }
    
    
    struct DrinkCellTitle: View {
        
        let name: String
        let style: String
        
        var body: some View {
            
            VStack(spacing: 0) {
                             
                Spacer().frame(height: 2)
                                
                Text(name)
                    .font(.system(size: 20, weight: .medium, design: .default))
                
                Text(style.capitalized)
                    .font(.system(size: 10, weight: .medium, design: .default))
                    .foregroundColor(Color(UIColor.subtitleText))
                
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
