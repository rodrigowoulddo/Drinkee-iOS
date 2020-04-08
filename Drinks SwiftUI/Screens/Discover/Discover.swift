//
//  Discover.swift
//  Drinks SwiftUI
//
//  Created by Rafael Ferreira on 07/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI
import Kingfisher

struct Discover: SwiftUI.View {

    //@ObservedObject var viewModel: DrinkListViewModel
    var testDrinks: [testDrink] = testData
    
    var body: some SwiftUI.View {
        NavigationView {
            FeaturedDrinksCollectionView(drinks: testDrinks)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        Discover().previewDevice(PreviewDevice(rawValue: "iPad mini (5th generation)"))
    }
}

// MARK: - Carrossel com os drinks em destaque
struct FeaturedDrinksCollectionView: SwiftUI.View {
    var drinks: [testDrink]
    
    var body: some SwiftUI.View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 80) {
                ForEach(drinks) { testDrink in
                    NavigationLink(destination: TransitionTest(testString: testDrink.name)) {
                        FeaturedDrink(drink: testDrink)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

// MARK: - "Celula de cada drink em destaque usada no carrossel
struct FeaturedDrink: SwiftUI.View {
    var drink: testDrink
    
    var body: some SwiftUI.View {
        VStack {
            URLImage(url: drink.thumbnailUrl)
            Text(drink.name)
        }.frame(width: 200, height: 250)
    }
}
