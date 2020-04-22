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
        case .home: return NSLocalizedString("Sidebar_HomeLabel", comment: "")
        case .drinks: return NSLocalizedString("Sidebar_DrinksLabel", comment: "")
        case .ingredients: return NSLocalizedString("Sidebar_IngredientsLabel", comment: "")
        case .favorites: return NSLocalizedString("Sidebar_FavoritesLabel", comment: "")
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

struct Sidebar: View {
    
    @State var currentTab: Tab
    
    var body: some View {
        
        HStack() {
            
            
            VStack(alignment: .center, spacing: 40) {
                
                VStack {
                    
                    Spacer().frame(height: 36)
                    
                    Image("Drinkee Icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65)
                    
                    Image("Drinkee Name")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65)
                    
                    Spacer().frame(height: 45)

                }
                
                TabButton(tab: .home, currentTab: $currentTab)
                TabButton(tab: .drinks, currentTab: $currentTab)
                TabButton(tab: .ingredients, currentTab: $currentTab)
                TabButton(tab: .favorites, isEnabled: false, currentTab: $currentTab)

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
    var isEnabled: Bool = true
    
    @Binding var currentTab: Tab
    
    var tintColor: Color {
        Color(tab == currentTab ? UIColor.tabBarSelectedTint : UIColor.tabBarUnselectedTint)
    }
    
    var body: some View {
        
        Button(action: {
            
            print("Did select \(self.tab.name) tab")
            self.currentTab = self.tab
            
        }) {
            
            VStack(alignment: .center) {
                
                Image(tab.iconName) /// TODO: - Verify if asset exists
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(tintColor)
                    .frame(width: 50, height: 50)
                            
                Text(tab.name).font(.system(size: 13))
                    .foregroundColor(tintColor)
            }
            
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(!isEnabled)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(currentTab: .home)
    }
}
