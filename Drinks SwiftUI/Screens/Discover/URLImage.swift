//
//  URLImage.swift
//  Drinks SwiftUI
//
//  Created by Rodrigo Giglio on 07/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI
import Kingfisher

enum ImageFade {
    case slow
    case regular
    case fast
    case none
    
    var duration: Double {
        switch self {
        case .slow: return 1.2
        case .regular: return 0.8
        case .fast: return 0.3
        case .none: return 0.0
        }
    }
}

struct URLImage: SwiftUI.View {
    
    let url: String
    var cornerRadius: Int = 0
    var shadowRadius: Int = 0
    var fade: ImageFade = .regular

    var body: some SwiftUI.View {
        KFImage(URL(string: url), options: [.transition(.fade(self.fade.duration))])
            .resizable()
            .aspectRatio(contentMode: .fill)
            .cornerRadius(CGFloat(cornerRadius))
            .shadow(radius: CGFloat(shadowRadius))
    }
    
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        URLImage(url: "https://www.thecocktaildb.com/images/media/drink/rxtqps1478251029.jpg", cornerRadius: 20, shadowRadius: 10).frame(width: 200, height: 600)
    }
}
