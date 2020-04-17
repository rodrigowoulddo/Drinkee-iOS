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
    
    let ingredient: Ingredient?
    
    var body: some View  {
        
        
        
        HStack {
            
            Spacer()
            
            ingredient.map {
                ingredient in
                
                ScrollView {
                    VStack {
                        ZStack {
                            IngredientDetailBlurImage(imageUrl: ingredient.photoUrlMedium)
                                .offset(y: -450)
                            VStack(alignment: .center, spacing: 0) {
                                
                                Spacer().frame(height: 30)
                                
                                IngredientDetailTitle(name: ingredient.name, strength: ingredient.strength)
                                
                                IngredientDetailImage(imageUrl: ingredient.photoUrlMedium)
                                    .scaleEffect(0.8)
                                    .offset(y: -50)
                                
                            }
                        }
                        
                        VStack {
                            
                            IngredientDetailAttributes(ingredient: ingredient)

                            DrinksFromIngredient(viewModel: DrinksFromIngredientViewModel(ingredient: ingredient))
                        
                        }.offset(y: -200)
                    }
                }
            }
            
            if ingredient == nil {
                Text("No ingredient selected")
                    .font(.title)
            }
            
            Spacer()
            
        }
        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
        
    }
}
struct IngredientDetailBlurImage: SwiftUI.View  {
    
    let imageUrl: String?
    
    var body: some SwiftUI.View  {
        
        URLImage(url: imageUrl, contentMode: .fit)
            .clipped()
            .frame(height: 1000)
            .opacity(0.9)
            .blur(radius: 45)
    }
}

struct IngredientDetailImage: SwiftUI.View  {
    
    let imageUrl: String?
    
    var body: some SwiftUI.View  {
        
        URLImage(url: imageUrl)
            .aspectRatio(contentMode: .fit)
            .frame(height: 600)
            .shadow(radius: 8)
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
                .font(.system(size: 38, weight: .bold, design: .default))
                .foregroundColor(Color(UIColor.darkTitle))
            
            VStack(spacing: 0) {
                
                AttributeRow(label: "Teor Alcoolico", value: String("\(Int(round(ingredient.strength * 100)))%"))
                AttributeRow(label: "Origem", value: ingredient.origin)

                
            }
            .cornerRadius(22)
            .shadow(color: Color(UIColor.shadow), radius: 17)
            .padding(35)
            
        }
        .padding()
        
    }
}

