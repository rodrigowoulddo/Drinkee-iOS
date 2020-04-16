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
            }.padding(.trailing)
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
    var cellWidth = UIScreen.main.bounds.size.width/3.7

    //TODO: - Find a better way of defining the width of the image
    var body: some SwiftUI.View {
        VStack {
            Text(drink.name)
                .padding(.top)
                .font(.system(.headline))
            Text(drink.strengthString)
                .font(.system(.caption))
                .foregroundColor(.gray)
            URLImage(url: drink.photoUrlMedium, contentMode: .fit)
                .padding(4)
            .frame(width: cellWidth, height: cellWidth)
        }.background(Color(UIColor.from(colorNamed: drink.color)))
            .cornerRadius(20)
    }
}
