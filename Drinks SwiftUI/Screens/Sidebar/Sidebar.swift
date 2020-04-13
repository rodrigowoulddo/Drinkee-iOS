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
        
        // TODO: - Localize
        switch self {
            case .home: return "Descubra"
            case .drinks: return "Drinks"
            case .ingredients: return "Ingredientes"
            case .favorites: return "Favoritos"
        }
    }
    
    var iconName: String {
        
        switch self {
            case .home: return "Discover"
            case .drinks: return "Drinks"
            case .ingredients: return "Favorites"
            case .favorites: return "Ingredients"
        }
    }
}

struct Sidebar: View {
    
    @State var currentTab: Tab
    
    var body: some View {
        
        HStack() {
            
            VStack(alignment: .center, spacing: 40) {
                
                TabButton(tab: .home, currentTab: $currentTab)
                TabButton(tab: .drinks, currentTab: $currentTab)
                TabButton(tab: .ingredients, currentTab: $currentTab)
                TabButton(tab: .favorites, currentTab: $currentTab)

                Spacer()
                
            }
            .frame(width: 80)
            .padding(16)
            .background(Color(UIColor.tabBarBackground))
            
            
            /// Selected tab
            getView(for: currentTab)
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
            
            VStack(alignment: .center) {
                
                Image(tab.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .accentColor(.white)
                .foregroundColor(Color(UIColor.tabBarSelectedTint))
                    .colorMultiply(Color(tab == currentTab ? UIColor.tabBarSelectedTint : UIColor.tabBarUnselectedTint))
                
                Text(tab.name).font(.system(size: 13))
                .foregroundColor(Color(tab == currentTab ? UIColor.tabBarSelectedTint : UIColor.tabBarUnselectedTint))
            }
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(currentTab: .home)
    }
}
