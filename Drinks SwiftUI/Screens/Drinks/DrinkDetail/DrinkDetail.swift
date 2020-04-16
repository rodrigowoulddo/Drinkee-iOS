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
                                .offset(y: -250)
                            
                            VStack {
                                
                                Spacer().frame(height: 30)
                                
                                DrinkDetailTitle(name: drink.name, strength: drink.strength)
                                
                                DrinkDetailImage(imageUrl: drink.photoUrlMedium)
                                    .offset(y: -50)
                                
                            }
                        }
                        
                        VStack {
                            
                            DrinkDetailAttributes(drink: drink)
                            
                            DrinkDetailIngredients(selectedDosageIndex: $selectedDosageIndex, selectedUnitIndex: $selectedUnitIndex, ingredients: drink.ingredients)
                            
                            DrinkDetailSteps(ingredients: drink.ingredients, steps: drink.steps).padding()
                            
                        }
                        .offset(y: -200)
                        
                    }
                }
            }
            
            if drink == nil {
                Text("No drink selected")
                    .font(.title)
            }
            
            Spacer()
            
        }
        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
        
    }
}


struct DrinkDetailImage: SwiftUI.View  {
    
    let imageUrl: String?
    
    var body: some SwiftUI.View  {
        
        URLImage(url: imageUrl)
            .aspectRatio(contentMode: .fit)
            .frame(height: 600)
            //.shadow(radius: 8)
    }
}

struct DrinkDetailBlurImage: SwiftUI.View  {
    
    let imageUrl: String?
    
    var body: some SwiftUI.View  {
        
        URLImage(url: imageUrl, contentMode: .fit)
            .clipped()
            .frame(height: 1000)
            .opacity(0.9)
            .blur(radius: 45)
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
            
        }
        .padding()
    }
}

struct DrinkDetailAttributes: View {
    
    let drink: Drink
    
    var body: some View {
        VStack {
            
            Text("Detalhes")
                .font(.system(size: 38, weight: .bold, design: .default))
                .foregroundColor(Color(UIColor.darkTitle))
            
            VStack(spacing: 0) {
                
                AttributeRow(label: "Teor Alcoolico", value: String("\(Int(round(drink.strength * 100)))%"))
                AttributeRow(label: "Estilo", value: drink.style)
                AttributeRow(label: "Autor", value: drink.author)
                
                if drink.baseSpirit != nil  {
                    AttributeRow(label: "Bebida base", value: drink.baseSpirit)
                }
                
                if drink.liquor != nil {
                    AttributeRow(label: "Bebida base", value: drink.liquor)
                }
                
                if drink.wineVermouth != nil {
                    AttributeRow(label: "Bebida Base", value: drink.wineVermouth)
                }
                
                AttributeRow(label: "Ingredientes", value: "", showSeparator: false) // TODO
                
            }
            .cornerRadius(22)
            .shadow(color: Color(UIColor.shadow), radius: 17)
            .padding(35)
            
        }
        .padding()
        
    }
}

struct AttributeRow: View {
    
    let label: String
    let value: String?
    var showSeparator: Bool = true
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            HStack {
                
                HStack {
                    Text(label)
                        .font(.system(size: 24, weight: .regular, design: .default))
                    
                    Spacer()
                }
                
                HStack {
                    Text(value?.capitalized ?? "")
                        .font(.system(size: 24, weight: .regular, design: .default))
                    
                    Spacer()
                }
                
            }
            
            Spacer().frame(height: 18)
            
            if showSeparator {
                Color(UIColor.separator).frame(height: 1)
            }
            
        }
        .padding(EdgeInsets(top: 30, leading: 40, bottom: 20, trailing: 40))
        .background(Color(UIColor.white))
    }
}

struct DrinkDetailIngredientSelectors: View {
    
    @Binding var selectedDosageIndex: Int
    @Binding var selectedUnitIndex: Int
    
    let units: [String]
    
    init(selectedDosageIndex: Binding<Int>, selectedUnitIndex: Binding<Int>, units: [String]) {
        
        self._selectedDosageIndex = selectedDosageIndex
        self._selectedUnitIndex = selectedUnitIndex
        self.units = units
        
        
        
        let font = UIFont.systemFont(ofSize: 24)
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.listBackground,
            .font: font
        ]
        
        let unselectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightText,
            .font: font
        ]
        
        UISegmentedControl.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(unselectedAttributes, for: .normal)
        
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().backgroundColor = .listBackground
    }
    
    var body: some View {
        HStack {
            
            VStack {
                
                Text("Doses")
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.darkTitle))
                
                Picker("Doses", selection: $selectedDosageIndex) {
                    ForEach(1 ..< 5) {
                        i in
                        
                        Text("\(i)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding()
            
            VStack {
                Text("Unidade de Medida")
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.darkTitle))
                
                Picker("Medida", selection: $selectedUnitIndex) {
                    
                    ForEach(self.units, id: \.self) {
                        unit in
                        
                        Text(unit)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding()
            .disabled(true)
            
        }
    }
}

struct DrinkDetailIngredients: View {
    
    @Binding var selectedDosageIndex: Int
    @Binding var selectedUnitIndex: Int
    
    let ingredients: [Ingredient]
    
    let units: [String] = ["ml", "cl", "oz"]
    
    var body: some View {
        VStack {
            
            Text("Ingredientes")
                .font(.system(size: 38, weight: .bold, design: .default))
                .foregroundColor(Color(UIColor.darkTitle))
            
            DrinkDetailIngredientSelectors(selectedDosageIndex: $selectedDosageIndex, selectedUnitIndex: $selectedUnitIndex, units: units)
                .padding(35)
            
            VStack {
                
                ForEach(ingredients, id: \.self) {
                    ingredient in
                    
                    DrinkDetailIngredientRow(selectedDosageIndex: self.$selectedDosageIndex, ingredient: ingredient)
                    
                }.padding()
                
            }
            
        }.padding()
    }
}

struct DrinkDetailIngredientRow: View {
    
    @Binding var selectedDosageIndex: Int

    let ingredient: Ingredient
    
    var adjustedMeasurement: Int {
        return ingredient.measurement * (selectedDosageIndex + 1)
    }
    
    var body: some View {
        HStack {
            
            HStack {
                Text("\(adjustedMeasurement) \(ingredient.measurementUnit)")
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.darkTitle))
                
                Spacer()
            }
            
            HStack {
                Text(ingredient.name)
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.darkTitle))
                
                Spacer()
            }
            
            
        }.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor.darkTitle), lineWidth: 1)
        )
            .background(Color(UIColor.from(colorNamed: ingredient.color)))
            .frame(height: 57)
    }
}

struct DrinkDetailSteps: View {
    
    let ingredients: [Ingredient]
    let steps: [String]
    
    var body: some View {
        VStack {
            
            Text("Preparação")
                .font(.system(size: 38, weight: .bold, design: .default))
                .foregroundColor(Color(UIColor.darkTitle))
            
            VStack {
                
                ForEach(steps, id: \.self) {
                    step in
                    
                    DrinkDetailStepRow(stepOrder: self.steps.firstIndex(of: step) ?? 0, step: step, stepCount: self.steps.count, ingredients: self.ingredients)
                }
            }.padding()
            
        }.padding()
    }
}

struct DrinkDetailStepRow: View {
    
    let stepOrder: Int
    let step: String
    let stepCount: Int
    let ingredients: [Ingredient]
    
    var stepSplit: [String] {
        
        var splits: [String] = []
        
        let splitedStepSubstrings = step.split(separator: " ")
        
        for splitSubstring in splitedStepSubstrings {
            splits.append(String(splitSubstring))
        }
        
        return splits
        
    }
    
    var attributedStep: [Text] {
        
        var attributedStepDictionary: [Text] = []
        
        for split in stepSplit {
            
            var didFound = false
            
            for i in 0 ..< ingredients.count {
                if split == "$\(i)" {
                    
                    didFound = true
                    
                    attributedStepDictionary.append(
                    Text(String(ingredients[i].name))
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(Color(UIColor.yellowText))
                    )
                }
            }
            
            if !didFound {
                attributedStepDictionary.append(
                    Text(String(split))
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.darkText))

                        
                )
            }
            
        }
        
        return attributedStepDictionary
        
    }
    
    var attributedText: Text {

        var text = Text("")

        for attributdedText in attributedStep {
            text = text + attributdedText + Text(" ")
        }

        return text
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack{
                Spacer()
                
                Text("Passo \(stepOrder + 1)/\(stepCount)")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.subtitleText))
                
                Spacer()
            }
            
            Spacer().frame(height: 10)
            
            HStack {
                
                Spacer()
                attributedText
                Spacer()

            }
            .padding(EdgeInsets(top: 30, leading: 40, bottom: 20, trailing: 40))
            .background(Color(UIColor.white))
            .cornerRadius(22)
            .shadow(color: Color(UIColor.shadow), radius: 17)
            
        }.padding()
    }
}

struct IngredientText: View {
    
    let text: String
    let color: String?
    
    var body: some View {
        
        Group {
            Text(text)
                .font(.system(size: 24, weight: .regular, design: .default))
                .foregroundColor(Color(UIColor.darkText))
        }
        .background(Color(UIColor.from(colorNamed: color)))
        .cornerRadius(10)
        .padding(4)
        
    }
    
}


struct DrinkDetail_Previews: PreviewProvider {
    
    private static let mockDrink = Drink.sampleDrink
    
    static var previews: some View {
        HStack {
            
            Color(UIColor.darkGray).frame(width: 335)
            
            DrinkDetail(drink: mockDrink)
            
        }
    }
}
