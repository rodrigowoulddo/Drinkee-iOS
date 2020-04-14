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
                
                if viewModel.drinks.isEmpty {
                    Text("No drinks were found.")
                }
                
                VStack (spacing: 2){
                    
                    DrinkListTitle()
                    
                    ForEach(viewModel.drinks, id: \.self) {
                        drink in
                        DrinkCell(viewModel: self.viewModel, drink: drink)
                    }
                }
            }
        }.background(Color(UIColor.listBackground))
    }
    
    struct DrinkListTitle: View {
        var body: some View {
            VStack(spacing: 0) {
                
                Spacer().frame(height: 40)
                
                Text("Drinks")
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
            .buttonStyle(PlainButtonStyle())
            .background(Color(UIColor.quaternarySystemFill))
            .frame(height: 144)
            .border(Color.white, width: 4)
            .cornerRadius(10)
            .padding(8)
            
        }
    }
    
    struct DrinkCellImage: View {
        
        let imageUrl: String?
        
        var body: some View {
            
            URLImage(url: imageUrl, shadowRadius: 5)
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 144)
                .shadow(radius: 4)
                .offset(y: 50)
            
        }
    }
    
    
    struct DrinkCellTitle: View {
        
        let name: String
        let style: String
        
        var body: some View {
            
            VStack(spacing: 0) {
                
                //Spacer().frame(height:12)
                
                Text(name)
                    .font(.system(size: 20))
                
                Text(style)
                    .font(.system(size: 10))
                    .foregroundColor(Color(UIColor.subTitleText))
                
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
