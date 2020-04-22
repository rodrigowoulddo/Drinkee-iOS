//
//  TabBar.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 22/04/20.
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
        case .ingredients: return "Ingredients"
        case .favorites: return "Favorites"
        }
    }
}

struct TabBar: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.tabBarUnselectedTint
    }
    
    var body: some View {
        
        TabView {
            
            TabItem(page: AnyView(HomePage()), tab: .home)
            TabItem(page: AnyView(DrinksPage()), tab: .drinks)
            TabItem(page: AnyView(IngredientsPage()), tab: .ingredients)
            TabItem(page: AnyView(FavoritesPage()), tab: .favorites)
            
        }
        .accentColor(Color(UIColor.tabBarSelectedTint))
    }
}

struct TabItem: View {
    
    let page: AnyView
    let tab: Tab
    
    var body: some View {
        
        page.tabItem {
            
            Image(tab.iconName)
                .renderingMode(.template)
                .scaledToFit()
            
            Text(tab.name)
        }
    }
}
