//
//  CollectionView.swift
//  
//
//  Created by Rafael Ferreira on 13/04/20.
//

import SwiftUI


struct CollectionView: SwiftUI.View {
    var drinks: [Drink] = Drink.sampleDrinks
    //TODO: - Mudar esse valor para detectar o dispositivo e se ajustar conforme o mesmo
    let drinksPerRow: Int = 2
    
    
    var body: some View {
        var cells: [[Int]] = []
        _ = (0...(drinks.count-1)).publisher //quantos elementos vao ser
        .collect(drinksPerRow) //quantos elementos por linha
        .collect()
        .sink(receiveValue: { cells = $0 })
        
        return ForEach(0..<cells.count, id: \.self) { collect in
            // Adding HStack to make 2 cells per line
            HStack {
                ForEach(cells[collect], id: \.self) { collection in
                    NavigationLink(destination: DrinkDetail(drink: self.drinks[collection])) {
                        CollectionViewCells(drink: self.drinks[collection])
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        CollectionView()
    }
}

struct CollectionViewCells: SwiftUI.View {
    var drink: Drink
    
    //MARK: - Para testar cores de background
    let backgroundTestColor = Color(
        red     : 130.0/255.0,
        green   : 23.0/255.0,
        blue    : 28.0/255.0
    )
    
    var body: some SwiftUI.View {
        VStack {
            Text(drink.name)
                .padding(.top)
                .font(.system(.headline))
            Text(String(drink.strength))
                .font(.system(.caption))
                .foregroundColor(.gray)
            URLImage(url: drink.photoUrlMedium!)
                .padding(4)
        }.background(self.backgroundTestColor.opacity(0.2))
            .cornerRadius(20)
    }
}