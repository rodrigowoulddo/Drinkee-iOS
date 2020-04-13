//
//  ContentView.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 01/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct DrinkList: View {
    
    @ObservedObject var viewModel: DrinkListViewModel
    
    init(viewModel: DrinkListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        HStack {
            
            ScrollView {
                
                if viewModel.drinks.count == 0 {
                    Text("No drinks were found.")
                }
                
                VStack {
                    
                    DrinkListTitle()
                    
                    ForEach(0 ..< viewModel.drinks.count, id: \.self) {
                        i in
                        
                        DrinkCell(viewModel: self.viewModel,drink: self.viewModel.drinks[i])
                    }
                }
            }
            
        }.background(Color(UIColor.drinkListBackground))
    }
}

struct DrinkListTitle: View {
    var body: some View {
        Text("Drinks")
            .font(.system(size: 33))
            .fontWeight(.semibold)
            .foregroundColor(Color(UIColor.white))
            .frame(height: 80)
    }
}

struct DrinkCell: View {
    
    @ObservedObject var viewModel: DrinkListViewModel
    
    let drink: Drink
    
    var backgroundColor: Color {
        return Color(UIColor.from(colorNamed: drink.color))
    }
    
    var body: some View {
        
        Button(action: { self.viewModel.selectedDrink = self.drink }) {
            
            ZStack {
                
                RadialGradient(
                    gradient: Gradient(colors: [.white, backgroundColor]),
                    center: .center,
                    startRadius: 1,
                    endRadius: 125
                )
                
                VStack {
                    
                    DrinkCellTitle(name: drink.name, style: drink.style)
                    DrinkCellImage(imageUrl: drink.photoUrlSmall)
                }
                
            }
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color(UIColor.quaternarySystemFill))
        .frame(height: 144)
        .border(Color.white, width: 4)
        .cornerRadius(10)
        .padding()
        
    }
}

struct DrinkCellImage: View {
    
    let imageUrl: String?
    
    var body: some View {
        
        URLImage(url: imageUrl, shadowRadius: 5)
        .frame(width: 120)
        .clipped()
        .shadow(radius: 4)
        
    }
}


struct DrinkCellTitle: View {
    
    let name: String
    let style: String
    
    var body: some View {

        VStack {
            
            Spacer().frame(height:20)
            
            Text(name)
                .font(.system(size: 20))
            
            Text(style)
                .font(.system(size: 10))
                .foregroundColor(Color(UIColor.subTitleText))
            
        }
        .padding(2)
        
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
        
    static var previews: some SwiftUI.View {
        
        HStack {
            DrinkList(viewModel: DrinkListViewModel()).frame(width: 250)
            Spacer()
        }
    }
}
