//
//  DetailViewModel.swift
//  CoctailGuide
//
//  Created by Sergey Zakurakin on 8/3/25.
//

import Foundation
import SwiftData

class DetailViewModel: ObservableObject {

    func saveCocktail(cocktail: Cocktail ,context: ModelContext) {
        let newCocktail = SavedCocktail(
            name: cocktail.name,
            ingraineds: cocktail.ingredients,
            instructions: cocktail.instructions
        )
        context.insert(newCocktail)
    }
}
