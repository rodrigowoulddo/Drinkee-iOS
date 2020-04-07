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
                
                VStack (spacing: 10) {
                    
                    ForEach(0 ..< viewModel.drinks.count, id: \.self) {
                        i in
                        
                        DrinkCell(viewModel: self.viewModel,drink: self.viewModel.drinks[i])
                    }
                }
            }
            
        }.background(Color(UIColor.systemGray6))
    }
}

struct DrinkCell: View {
    
    @ObservedObject var viewModel: DrinkListViewModel
    
    let drink: Drink
    var body: some View {
        
        Button(action: {
            self.viewModel.selectedDrink = self.drink
        }) {
            HStack {
                Circle().fill(Color(.gray)).frame(width: 30, height: 30)
                Text(drink.name).foregroundColor(.black)
                Spacer()
            }
            .padding(10)
        }
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
