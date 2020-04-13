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
                
                if viewModel.categories.count == 0 {
                    Text("No drinks were found.")
                }
                
                VStack(spacing: 10) {
                    
                    ForEach(0 ..< viewModel.categories.count, id: \.self) {
                        i in
                        HStack {
                            
                            Spacer()
                            Text(self.viewModel.categories[i].name)
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
