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
                    
                    VStack(alignment: .center, spacing: 0) {
                        
                        ZStack {
                            
                            IngredientDetailBlurImage(imageUrl: ingredient.photoUrlMedium)
                                .offset(y: -250)
                            
                            VStack {
                                
                                Spacer().frame(height: 30)
                                
                                IngredientDetailTitle(name: ingredient.name, strength: ingredient.strength)
                                
                                IngredientDetailImage(imageUrl: ingredient.photoUrlMedium)
                                    .offset(y: -50)
                                
                            }
                        }
                        
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


struct IngredientDetailImage: SwiftUI.View  {
    
    let imageUrl: String?
    
    var body: some SwiftUI.View  {
        
        URLImage(url: imageUrl)
            .aspectRatio(contentMode: .fit)
            .frame(height: 600)
            .shadow(radius: 8)
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



