//
//  DrinkDetail.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 01/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct DrinkDetail: View {
    
    let drink: Drink?
    
    var body: some View  {
        
        HStack {
            Spacer()
            
            VStack(alignment: .center) {
                
                Text(self.drink?.name ?? "No drink selected")
                    .font(.title)
                    .foregroundColor(Color(UIColor.label))
                
                Text("Lorem ipsum dolor sit")
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.secondaryLabel))
                
            }
            
            Spacer()
        }

    }
}


//struct CircleImage: SwiftUI.View  {
//
//    let imageUrl: String
//
//    var body: some SwiftUI.View  {
//
//        KFImage(URL(string: imageUrl))
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 300, height: 300)
//            .clipShape(Circle())
//            .overlay(Circle().stroke(Color.white, lineWidth: 2))
//            .shadow(radius: 4)
//    }
//}

//struct ShadeImage: SwiftUI.View {
//
//    let imageUrl: String
//
//    var body: some SwiftUI.View  {
//
//        KFImage(URL(string: imageUrl))
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .opacity(0.6)
//    }
//
//}

//struct DrinkBackground: SwiftUI.View {
//    let geometry: GeometryProxy
//    var body: some SwiftUI.View {
//        VStack {
//            //DrinkDetailIcon()
//
//            Color(UIColor.systemBackground)
//        }
//    }
//}

//struct DrinkBackgroundImage: SwiftUI.View {
//    let thumbnailUrl: String
//    let geometry: GeometryProxy
//    var body: some SwiftUI.View {
//        ShadeImage(imageUrl: thumbnailUrl)
//            .edgesIgnoringSafeArea(.top)
//            .frame(width: geometry.size.width, height: geometry.size.height / 2)
//    }
//}

struct DrinkDetail_Previews: PreviewProvider {
    
    private static let mockDrink = Drink(numberOfRatingVotes: 10, name: "Mock Drink", strength: 8.4, style: "Classic", rating: 8.1, author: "Didico", baseSpirit: "Aperol", ingredients: [Ingredient(name: "Aperol", strength: 6, measurement: 2, measurementUnit: "ml")], liquor: nil, wineVermouth: nil)
    
    static var previews: some View {
        DrinkDetail(drink: mockDrink)
    }
}
