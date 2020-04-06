//
//  ContentView.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 01/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI
import Kingfisher

struct DrinkList: SwiftUI.View {
    
    @ObservedObject var viewModel: DrinkListViewModel
    
    init(viewModel: DrinkListViewModel) {
        self.viewModel = viewModel
    }
        
    var body: some SwiftUI.View {
        
        NavigationView {
            
            List {
                
                ForEach(0 ..< viewModel.drinks.count, id: \.self) {
                    i in
                    
                    DrinkCell(drink: self.viewModel.drinks[i])
                }

            }
            .navigationBarTitle(Text("Drinks"))


            
            Text("Select a Drink")
                .font(.headline)
            
        }
        .accentColor(Color.white)
    }
}

struct DrinkCell: SwiftUI.View {
    let drink: Drink
    var body: some SwiftUI.View {
        NavigationLink(destination: DrinkDetail(drink: drink)) {
            
            HStack {
                
                //DrinkIcon()
                
                Spacer().frame(width: 20)
                
                Text(drink.name)
                
            }
            .padding(8)
        }
    }
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        DrinkList(viewModel: DrinkListViewModel()).previewDevice(PreviewDevice(rawValue: "iPad mini (5th generation)"))
    }
}

struct DrinkIcon: SwiftUI.View {
    let thumbnailUrl: String
    var body: some SwiftUI.View {
        KFImage(URL(string: thumbnailUrl))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 4)
    }
}
