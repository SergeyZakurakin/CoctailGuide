//
//  Coctail.swift
//  CocktailGuide
//
//  Created by Sergey Zakurakin on 8/3/25.
//

import Foundation

struct Cocktail: Codable {
    let name: String
    let ingredients: [String]
    let instructions: String
}
