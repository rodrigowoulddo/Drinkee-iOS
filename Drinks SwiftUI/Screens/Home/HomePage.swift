//
//  HomePage.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 07/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        HStack {
            
            ScrollView {
                
                if viewModel.categories.isEmpty {
                    Text("No drinks were found.")
                }
                
                VStack(spacing: 10) {
                    
                    ForEach(viewModel.categories, id: \.self) {
                        category in
                        
                        HStack {
                            
                            Spacer()
                            Text(category.name)
                            Spacer()
                        }
                    }
                    
                    // Color(.systemPink).frame(height: 250)
                    // Color(.systemPink).frame(height: 250)
                    // Color(.systemPink).frame(height: 250)
                    // Color(.systemPink).frame(height: 250)
                    // Color(.systemPink).frame(height: 250)
                    // Color(.systemPink).frame(height: 250)
                    // Color(.systemPink).frame(height: 250)
                    // Color(.systemPink).frame(height: 250)
                    
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
