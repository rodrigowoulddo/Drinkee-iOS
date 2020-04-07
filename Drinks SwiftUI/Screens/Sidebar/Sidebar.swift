//
//  TabBar.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 06/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

enum Tab {
    case home
    case drinks
    case ingredients
    case favorites
    
    var name: String {
        
        switch self {
            case .home: return "Home"
            case .drinks: return "Drinks"
            case .ingredients: return "Ingredients"
            case .favorites: return "Favorites"
        }
    }
    
    var iconName: String {
        
        switch self {
            case .home: return "house.fill"
            case .drinks: return "sun.min.fill"
            case .ingredients: return "cart.fill"
            case .favorites: return "star.fill"
        }
    }
}

struct Sidebar: View {
    
    @State var currentTab: Tab
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 10) {
                
                TabButton(tab: .home, currentTab: $currentTab)
                TabButton(tab: .drinks, currentTab: $currentTab)
                TabButton(tab: .ingredients, currentTab: $currentTab)
                TabButton(tab: .favorites, currentTab: $currentTab)

                Spacer()
                
            }
            .frame(width: 45)
            .padding(16)
            .background(Color(UIColor.secondarySystemFill))
            
            
            /// Selected tab
            getView(for: currentTab).padding(16)
        }
    }
    
    func getView(for tab: Tab) -> AnyView {
        
        switch tab {
        case .home: return AnyView(HomePage())
        case .drinks: return AnyView(DrinksPage())
        case .ingredients: return AnyView(IngredientsPage())
        case .favorites: return AnyView(FavoritesPage())

        }
        
    }
}

struct TabButton: View {
    
    let tab: Tab
    
    @Binding var currentTab: Tab
    
    var body: some View {
        Button(action: {
            
            print("Did select \(self.tab.name) tab")
            self.currentTab = self.tab
            
        }) {
            Image(systemName: self.tab.iconName)
                .frame(width: 50, height: 50)
                .accentColor(.white)
                .background(Circle().fill(Color(UIColor.systemPink)))
        }.padding(16)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(currentTab: .home)
    }
}
