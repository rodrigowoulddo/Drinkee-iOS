//
//  HomePage.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 07/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        
        HStack {
            
            ScrollView {
                
                VStack(spacing: 10) {
                    
                    Color(.systemPink).frame(height: 250)
                    Color(.systemPink).frame(height: 250)
                    Color(.systemPink).frame(height: 250)
                    Color(.systemPink).frame(height: 250)
                    Color(.systemPink).frame(height: 250)
                    Color(.systemPink).frame(height: 250)
                    Color(.systemPink).frame(height: 250)
                    Color(.systemPink).frame(height: 250)
                    
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
