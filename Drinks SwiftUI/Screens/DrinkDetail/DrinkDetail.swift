//
//  DrinkDetail.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 01/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI
import Kingfisher

struct DrinkDetail: SwiftUI.View {
    
    let drink: Drink
    
    var body: some SwiftUI.View  {
        
        VStack {
            
            GeometryReader {
                geometry in
                
                ZStack {
                    
                    DrinkBackground(geometry: geometry)
                    
                    VStack {
                        
                        //CircleImage()
                        
                        VStack(alignment: .center) {
                            
                            Text(self.drink.name)
                                .font(.title)
                                .foregroundColor(Color(UIColor.label))
                            
                            Text("Lorem ipsum dolor sit")
                                .font(.subheadline)
                                .foregroundColor(Color(UIColor.secondaryLabel))
                            
                        }
                        .padding()
                    }
                    
                }
            }

            

            
            Spacer()
        }
    }
}


struct CircleImage: SwiftUI.View  {
    
    let imageUrl: String
    
    var body: some SwiftUI.View  {
        
        KFImage(URL(string: imageUrl))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 4)
    }
}

struct ShadeImage: SwiftUI.View {
    
    let imageUrl: String

    var body: some SwiftUI.View  {
        
        KFImage(URL(string: imageUrl))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .opacity(0.6)
    }
    
}

//struct DrinkDetail_Previews: PreviewProvider {
//    static var previews: some SwiftUI.View  {
//        DrinkDetail(drink: ).previewDevice(PreviewDevice(rawValue: "iPad mini (5th generation)"))
//    }
//}

struct DrinkBackground: SwiftUI.View {
    let geometry: GeometryProxy
    var body: some SwiftUI.View {
        VStack {
            //DrinkDetailIcon()
            
            Color(UIColor.systemBackground)
        }
    }
}

struct DrinkBackgroundImage: SwiftUI.View {
    let thumbnailUrl: String
    let geometry: GeometryProxy
    var body: some SwiftUI.View {
        ShadeImage(imageUrl: thumbnailUrl)
            .edgesIgnoringSafeArea(.top)
            .frame(width: geometry.size.width, height: geometry.size.height / 2)
    }
}
