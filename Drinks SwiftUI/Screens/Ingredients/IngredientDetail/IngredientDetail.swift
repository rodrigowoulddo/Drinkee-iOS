//
//  IngredientDetail.swift
//  Drinks SwiftUI
//
//  Created by Eduardo Ribeiro on 16/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//
import SwiftUI

struct IngredientDetail: View {
    
    @State private var selectedDosageIndex = 0
    @State private var selectedUnitIndex = 0
    @State var showLoad: Bool = true
    
    let ingredient: Ingredient?
    
    var body: some View  {
        
        
        
        HStack {
            
            Spacer()
            
            ingredient.map {
                ingredient in
                
                ScrollView(showsIndicators: false) {
                    
                    VStack {
                        
                        ZStack {
                            
                            IngredientDetailBlurImage(imageUrl: ingredient.photoUrlMedium)
                                .offset(y: -250)
                            
                            VStack(alignment: .center, spacing: 0) {
                                
                                Spacer().frame(height: 30)
                                
                                IngredientDetailImage(imageUrl: ingredient.photoUrlMedium)
                                    .offset(y: -50)
                                
                            }
                        }
                        
                        VStack {
                            
                            IngredientDetailAttributes(ingredient: ingredient)
                            
                            Spacer().frame(height: 25)
                            
                            DrinksFromIngredient(viewModel: DrinksFromIngredientViewModel(ingredient: ingredient))
                            
                        }.offset(y: -80)
                    }
                }
                .navigationBarTitle(Text(ingredient.name))
                
            }
            
            if ingredient == nil {
                
                HStack {
                    
                    Spacer()
                    
                    VStack () {
                        
                        Spacer()
                        ActivityIndicator(isAnimating: $showLoad, style: .large)
                        Spacer()
                        
                    }
                    
                    Spacer()
                }
            }
            
            Spacer()
            
        }
    }
}
struct IngredientDetailBlurImage: SwiftUI.View  {
    
    let imageUrl: String?
    
    var body: some SwiftUI.View  {
        
        URLImage(url: imageUrl, contentMode: .fit)
            .clipped()
            .frame(height: 400)
            .opacity(0.9)
            .blur(radius: 45)
    }
}

struct IngredientDetailImage: SwiftUI.View  {
    
    let imageUrl: String?
    
    var body: some SwiftUI.View  {
        
        URLImage(url: imageUrl)
            .aspectRatio(contentMode: .fit)
            .frame(height: 325)
    }
}

struct IngredientDetailTitle: View {
    
    let name: String
    let strength: Double
    
    var body: some View {
        VStack {
            
            Text(name)
                .font(.system(size: 48, weight: .bold, design: .default))
                .foregroundColor(Color(UIColor.darkTitle))
            
            Text("\(Int(round(strength * 100)))%") // TODO: - Add Light / Medium / Strong
                .font(.system(size:24, weight: .regular, design: .default))
                .foregroundColor(Color(UIColor.white))
            
        }
        .padding()
    }
}

struct IngredientDetailAttributes: View {
    
    let ingredient: Ingredient
    
    var body: some View {
        VStack {
            
            Text("Detalhes")
                .font(.system(size: 36, weight: .bold, design: .default))
                .foregroundColor(Color(UIColor.darkTitle))
            
            Spacer().frame(height: 25)
            
            VStack(spacing: 0) {
                
                AttributeRow(label: "Teor Alcoolico", value: String("\(Int(round(ingredient.strength * 100)))%"))
                AttributeRow(label: "Origem", value: ingredient.origin, showSeparator: false)
                
            }
            .cornerRadius(22)
            .shadow(color: Color(UIColor.shadow), radius: 17)
            
        }
        .padding()
        
    }
}
