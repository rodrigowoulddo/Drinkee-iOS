//
//  DrinkDetail.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 01/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct DrinkDetail: View {
    
    @State private var selectedDosageIndex = 0
    @State private var selectedUnitIndex = 0
    
    let drink: Drink?
    
    var body: some View  {
        
        
        
        HStack {
            
            Spacer()
            
            drink.map {
                drink in
                
                ScrollView {
                    
                    VStack(alignment: .center, spacing: 0) {
                        
                        ZStack {
                            
                            DrinkDetailBlurImage(imageUrl: drink.photoUrlMedium)
                                .offset(y: -80)
                            
                            VStack {
                                
                                // Favorite button
                                // HStack {
                                //    Spacer()
                                //    FavoriteButton(drinkName: drink.name)
                                // }
                                
                                Spacer().frame(height: 30)
                                
                                DrinkDetailTitle(name: drink.name, strength: drink.strength)
                                
                                DrinkDetailImage(imageUrl: drink.photoUrlMedium)
                                    .offset(y: -50)
                                
                            }
                        }
                        
                        VStack {
                            
                            DrinkDetailAttributes(drink: drink)
                                //.offset(y: -150)
                            
                            DrinkDetailSteps(ingredients: drink.ingredients, steps: drink.steps).padding()
                            
                            DrinkDetailIngredients(selectedDosageIndex: $selectedDosageIndex, selectedUnitIndex: $selectedUnitIndex, ingredients: drink.ingredients)
                        }
                        .offset(y: -150)
                        
                    }
                }
            }
            
            if drink == nil {
                Text("No drink selected")
                    .font(.title)
            }
            
            Spacer()
        }
        
    }
}


struct DrinkDetailImage: SwiftUI.View  {
    
    let imageUrl: String?
    
    var body: some SwiftUI.View  {
        
        URLImage(url: imageUrl)
            .aspectRatio(contentMode: .fit)
            .frame(height: 600)
            .shadow(radius: 8)
    }
}

struct DrinkDetailBlurImage: SwiftUI.View  {
    
    let imageUrl: String?
    
    var body: some SwiftUI.View  {
        
        URLImage(url: imageUrl)
            .aspectRatio(contentMode: .fit)
            .frame(height: 900)
            .shadow(radius: 8)
            .opacity(0.8)
            .blur(radius: 20)
    }
}

struct FavoriteButton: View {
    
    let drinkName: String
    
    var body: some View {
        Button(action: {
            print("Did Favourite \(self.drinkName)")
        }) {
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
                .foregroundColor(Color(UIColor.systemPink))
            
        }
    }
}

struct DrinkDetailTitle: View {
    
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
        }.padding()
    }
}

struct DrinkDetailAttributes: View {
    
    let drink: Drink
    
    var body: some View {
        VStack {
            
            Text("Características").font(.title)
            
            VStack {
                
                AttributeRow(label: "Força", value: String(drink.strength))
                AttributeRow(label: "Estilo", value: drink.style)
                AttributeRow(label: "Autor", value: drink.author)
                AttributeRow(label: "Bebida base", value: drink.baseSpirit)
                AttributeRow(label: "Liquor", value: drink.liquor)
                AttributeRow(label: "Wine Vermouth", value: drink.wineVermouth)
                
            }.padding()
            
        }.padding()
    }
}

struct AttributeRow: View {
    
    let label: String
    let value: String?
    
    var body: some View {
        HStack {
            
            HStack {
                Spacer()
                Text(label).font(.headline)
                Spacer()
            }
            
            HStack {
                Spacer()
                Text(value ?? "--")
                Spacer()
            }
            
        }.frame(height: 30)
            .padding(8)
            .background(Color(UIColor.tertiarySystemFill))
    }
}

struct DrinkDetailSteps: View {
    
    let ingredients: [Ingredient]
    let steps: [String]
    
    var body: some View {
        VStack {
            
            Text("Preparo").font(.title)
            
            VStack {
                
                ForEach(steps, id: \.self) {
                    step in
                    
                    DrinkDetailStepRow(stepOrder: self.steps.firstIndex(of: step) ?? 0, step: step)
                }
            }.padding()
            
        }.padding()
    }
}

struct DrinkDetailStepRow: View {
    
    let stepOrder: Int
    let step: String
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Text("Passo \(stepOrder)").font(.headline)
                Spacer()
            }
            Text(step).multilineTextAlignment(.leading)
            
        }.padding()
            .background(Color(UIColor.tertiarySystemFill))
    }
}

struct DrinkDetailIngredients: View {
    
    @Binding var selectedDosageIndex: Int
    @Binding var selectedUnitIndex: Int
    
    let ingredients: [Ingredient]
    
    let units: [String] = ["ml", "cl", "oz"]
    
    var body: some View {
        VStack {
            
            Text("Ingredientes").font(.title)
            
            DrinkDetailIngredientSelectors(selectedDosageIndex: $selectedDosageIndex, selectedUnitIndex: $selectedUnitIndex, units: units)
            
            VStack {
                
                ForEach(ingredients, id: \.self) {
                    ingredient in
                    
                    DrinkDetailIngredientRow(ingredient: ingredient)
                    
                }.padding()
                
            }
            
        }.padding()
    }
}

struct DrinkDetailIngredientSelectors: View {
    
    @Binding var selectedDosageIndex: Int
    @Binding var selectedUnitIndex: Int
    
    let units: [String]
    
    var body: some View {
        HStack {
            
            // 1
            VStack {
                Text("Doses")
                
                Picker("Doses", selection: $selectedDosageIndex) {
                    ForEach(1 ..< 5) {
                        i in
                        
                        Text("\(i)")
                        
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }.padding()
            
            // 2
            VStack {
                Text("Medida")
                
                Picker("Medida", selection: $selectedUnitIndex) {
                    
                    ForEach(self.units, id: \.self) {
                        unit in
                        
                        Text(unit)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding()
            
        }
    }
}

struct DrinkDetailIngredientRow: View {
    
    let ingredient: Ingredient
    
    var body: some View {
        HStack {
            Text("\(ingredient.measurement) \(ingredient.measurementUnit)").font(.headline)
            Text(ingredient.name)
            Spacer()
            
        }.padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(10)
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    
    private static let mockDrink = Drink.sampleDrink
    
    static var previews: some View {
        DrinkDetail(drink: mockDrink)
    }
}
