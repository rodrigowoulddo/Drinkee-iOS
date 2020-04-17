//
//  IngredientList.swift
//  Ingredients SwiftUI
//
//  Created by Eduardo Ribeiro on 16/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct IngredientList: View {

    @State var showLoad: Bool = true
    
    @ObservedObject var viewModel: IngredientListViewModel
    
    init(viewModel: IngredientListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            
            if viewModel.ingredients.isEmpty {
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
                
                ScrollView {
                    
                    VStack (spacing: 2){
                        
                        IngredientListTitle()
                        
                        ForEach(viewModel.ingredients, id: \.self) {
                            ingredient in
                            IngredientCell(viewModel: self.viewModel, ingredient: ingredient)
                        }
                    }
                }
            }
            
        }.background(Color(UIColor.listBackground))
    }
    
    struct IngredientListTitle: View {
        var body: some View {
            VStack(spacing: 0) {
                
                Spacer().frame(height: 40)
                
                Text("Ingredients")
                    .font(.system(size: 33))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.white))
                    .frame(height: 50)
                
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .foregroundColor(Color(UIColor.white))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 18)
            }
        }
    }
    
    struct IngredientCell: View {
        
        @ObservedObject var viewModel: IngredientListViewModel
        
        let ingredient: Ingredient
        
        var backgroundColor: Color {
            return Color(UIColor.from(colorNamed: ingredient.color))
        }
        
        var body: some View {
            
            Button(action: { self.viewModel.selectedIngredient = self.ingredient }) {
                
                ZStack {
                    
                    RadialGradient(
                        gradient: Gradient(colors: [.white, backgroundColor]),
                        center: .center,
                        startRadius: 1,
                        endRadius: 125
                    )
                    
                    VStack {
                        Spacer()
                        IngredientCellImage(imageUrl: ingredient.photoUrlMedium)
                    }
                    
                    VStack(alignment: .leading) {
                        Spacer().frame(height: 8)
                        IngredientCellTitle(name: ingredient.name)
                        Spacer()
                    }
                    
                }
            }
            .buttonStyle(PlainButtonStyle())
            .background(Color(UIColor.quaternarySystemFill))
            .frame(height: 144)
            .border(Color.white, width: 2)
            .cornerRadius(10)
            .padding(8)
            
        }
    }
    
    struct IngredientCellImage: View {
        
        let imageUrl: String?
        
        var body: some View {
            
            URLImage(url: imageUrl)
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 144)
                .offset(y: 50)
            
        }
    }
    
    
    struct IngredientCellTitle: View {
        
        let name: String
        
        var body: some View {
            
            VStack(spacing: 0) {
                             
                Spacer().frame(height: 2)
                                
                Text(name)
                    .font(.system(size: 20, weight: .medium, design: .default))

            }
        }
    }
    
    // MARK: - Preview
    struct ContentView_Previews: PreviewProvider {
        
        static var previews: some SwiftUI.View {
            
            HStack {
                IngredientList(viewModel: IngredientListViewModel()).frame(width: 215)
                Spacer()
            }
        }
    }
    
}
