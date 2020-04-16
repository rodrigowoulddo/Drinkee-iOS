//
//  CollectionView.swift
//  
//
//  Created by Rafael Ferreira on 13/04/20.
//

import SwiftUI


struct CollectionView: SwiftUI.View {
    
    @ObservedObject var viewModel: CollecTionViewViewModel
        
    var drinksPerRow: Int {
        if UIDevice.current.model == "iPad" {
            return 3
        } else {
            return 2
        }
    }
    
    init(viewModel: CollecTionViewViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        
        var cells: [[Int]] = []
        _ = (0...(viewModel.drinks.count-1)).publisher //quantos elementos vao ser
        .collect(drinksPerRow) //quantos elementos por linha
        .collect()
        .sink(receiveValue: { cells = $0 })
        
        return ForEach(0..<cells.count, id: \.self) { rowIndex in
            // Adding HStack to make 2 cells per line
            HStack {
                ForEach(cells[rowIndex], id: \.self) { cellIndex in
                    NavigationLink(destination: DrinkDetail(drink: self.viewModel.drinks[cellIndex])) {
                        CollectionViewCells(drink: self.viewModel.drinks[cellIndex])
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        CollectionView(viewModel: CollecTionViewViewModel(categoryId: "babc2777-7a80-4174-8bda-115e6a1f8ec0"))
    }
}

struct CollectionViewCells: SwiftUI.View {
    var drink: Drink
    
    //TODO: - Mudar essa cor para uma cor salva no banco
    let backgroundTestColor = Color(
        red     : 130.0/255.0,
        green   : 23.0/255.0,
        blue    : 28.0/255.0
    )
    
    var strengthString: String {
        if(drink.strength < 11) {
            return "Light (\(drink.strength * 100)%)"
        } else if (drink.strength < 20) {
            return "Medium (\(drink.strength * 100)%)"
        } else if (drink.strength < 30) {
            return "Strong (\(drink.strength * 100)%)"
        } else {
            return "Very Strong (\(drink.strength * 100)%)"
        }
    }
    
    var body: some SwiftUI.View {
        VStack {
            Text(drink.name)
                .padding(.top)
                .font(.system(.headline))
            Text(strengthString)
                .font(.system(.caption))
                .foregroundColor(.gray)
            URLImage(url: drink.photoUrlMedium, contentMode: .fit)
                .padding(4)
        }.background(self.backgroundTestColor.opacity(0.2))
            .cornerRadius(20)
            //.aspectRatio(1, contentMode: .fit)
    }
}
