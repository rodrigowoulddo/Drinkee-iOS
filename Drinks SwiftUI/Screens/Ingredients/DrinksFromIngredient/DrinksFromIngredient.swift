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
                
                ScrollView(showsIndicators: false) {
                    
                    VStack (spacing: 36) {
                        
                        DrinkListTitle(ingredient: viewModel.ingredient)
                        
                        ForEach(viewModel.drinks, id: \.self) {
                            drink in
                            DrinkCell(viewModel: self.viewModel, drink: drink)
                                .frame(height: 144)
                                .cornerRadius(10)
                                .shadow(color: Color(UIColor.shadow), radius: 17)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(UIColor.white), lineWidth: 1))
                        }
                    }.padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                }
            }
        }
    }
    
    struct DrinkListTitle: View {
        
        let ingredient: Ingredient
        
        var body: some View {
            
                
            Text("Drinks com \(ingredient.name)")
                .font(.system(size: 38))
                .fontWeight(.semibold)
                .foregroundColor(Color(UIColor.black))
                .frame(height: 56)
                
        }
    }
    
    struct DrinkCell: View {
        
        @ObservedObject var viewModel: DrinksFromIngredientViewModel
        
        @State var showingDetail = false
        
        let drink: Drink
        
        var backgroundColor: Color {
            return Color(UIColor.from(colorNamed: drink.color))
        }
        
        var body: some View {
            
            Button (action: {
                self.showingDetail.toggle()
            }) {
                
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
                                .padding(18)
                        }
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $showingDetail) {
                DrinkDetail(drink: self.drink)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
    
    struct DrinkCellImage: View {
        
        let imageUrl: String?
        
        var body: some View {
            
            URLImage(url: imageUrl)
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height:144)
                .offset(y: 50)
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
                        .font(.system(size: 28, weight: .semibold, design: .default))
                        .foregroundColor(Color(UIColor.darkText))
                    
                    Spacer().frame(height: 2)
        
                    Text(style.capitalized)
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(Color(UIColor.subtitleText))
                    
                    Spacer().frame(height: 10)
                    
                    Text(ingredients.map{ $0.name }.joined(separator: ", "))
                        .font(.system(size: 15, weight: .regular, design: .default))
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
