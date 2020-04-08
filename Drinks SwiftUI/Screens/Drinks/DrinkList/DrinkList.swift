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
                    
                    ForEach(0 ..< viewModel.drinks.count, id: \.self) {
                        i in
                        
                        DrinkCell(viewModel: self.viewModel,drink: self.viewModel.drinks[i])
                    }
                }
            }
            
        }
    }
}

struct DrinkCell: View {
    
    @ObservedObject var viewModel: DrinkListViewModel
    
    let drink: Drink
    var body: some View {
        
        Button(action: { self.viewModel.selectedDrink = self.drink }) {
            
            HStack {
                
                DrinkCellImage(imageUrl: drink.photoUrlSmall)
                DrinkCellTitle(name: drink.name)
                Spacer()
            }
            .padding(8)
            
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color(UIColor.quaternarySystemFill))
    .padding(4)
    }
}

struct DrinkCellImage: View {
    
    let imageUrl: String?
    
    var body: some View {
        
        URLImage(url: imageUrl, shadowRadius: 5)
        .frame(width: 60, height: 60)
        .clipShape(Circle())
        .shadow(radius: 4)
        
    }
}


struct DrinkCellTitle: View {
    
    let name: String
    
    var body: some View {
        Text(name)
            .padding()
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
        
    static var previews: some SwiftUI.View {
        
        HStack {
            DrinkList(viewModel: DrinkListViewModel())
            Spacer()
        }
    }
}
