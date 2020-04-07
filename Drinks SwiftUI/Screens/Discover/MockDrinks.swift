//
//  MockDrinks.swift
//  Drinks SwiftUI
//
//  Created by Rafael Ferreira on 07/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import Foundation

struct testDrink: Identifiable {
    
    let id: Int64
    let name: String
    let thumbnailUrl: String
    
}

#if DEBUG

let testData = [
    testDrink(id: 11026, name: "Amaretto Mist", thumbnailUrl: "https://www.thecocktaildb.com/images/media/drink/3jm41q1493069578.jpg"),
    testDrink(id: 15086, name: "Limona Corona", thumbnailUrl: "https://www.thecocktaildb.com/images/media/drink/wwqrsw1441248662.jpg"),
    testDrink(id: 17250, name: "Corpse Reviver", thumbnailUrl: "https://www.thecocktaildb.com/images/media/drink/gifgao1513704334.jpg"),
    testDrink(id: 15224, name: "Manhattan", thumbnailUrl: "https://www.thecocktaildb.com/images/media/drink/2dwae41504885321.jpg"),
    testDrink(id: 13621, name: "Tequila Sunrise", thumbnailUrl: "https://www.thecocktaildb.com/images/media/drink/quqyqp1480879103.jpg"),
    testDrink(id: 17196, name: "Cosmopolitan", thumbnailUrl: "https://www.thecocktaildb.com/images/media/drink/kpsajh1504368362.jpg")
]

#endif
