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
                    Text("No drinks where found :(")
                }
                
                VStack (spacing: 10) {
                    
                    ForEach(0 ..< viewModel.drinks.count, id: \.self) {
                        i in
                        
                        DrinkCell(drink: self.viewModel.drinks[i])
                    }
                }
            }
        }
    }
}

struct DrinkCell: View {
    let drink: Drink
    var body: some View {
        
        HStack {
            Circle().fill(Color(.gray)).frame(width: 50, height: 50)
            Text(drink.name)
        }
        .padding(8)
    }
}

//struct DrinkIcon: SwiftUI.View {
//    let thumbnailUrl: String
//    var body: some SwiftUI.View {
//        KFImage(URL(string: thumbnailUrl))
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 60, height: 60)
//            .clipShape(Circle())
//            .overlay(Circle().stroke(Color.white, lineWidth: 2))
//            .shadow(radius: 4)
//    }
//}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        DrinkList(viewModel: DrinkListViewModel())
    }
}
