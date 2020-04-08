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
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 80) {
                    ForEach(testDrinks) { testDrink in
                        NavigationLink(destination: TransitionTest(testString: testDrink.name)) {
                                FeaturedDrink(drink: testDrink)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        Discover().previewDevice(PreviewDevice(rawValue: "iPad mini (5th generation)"))
    }
}

struct FeaturedDrink: SwiftUI.View {
    var drink: testDrink
    
    var body: some SwiftUI.View {
        VStack {
            URLImage(url: drink.thumbnailUrl)
            Text(drink.name)
        }.frame(width: 200, height: 250)
    }
}
