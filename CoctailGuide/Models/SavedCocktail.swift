//
//  SavedCocktail.swift
//  CocktailGuide
//
//  Created by Sergey Zakurakin on 8/3/25.
//

import Foundation
import SwiftData

@Model
class SavedCocktail {
    var id: UUID = UUID()
    var name: String
    var ingraineds: [String]
    var instructions: String

    init(name: String, ingraineds: [String], instructions: String) {
        self.id = UUID()
        self.name = name
        self.ingraineds = ingraineds
        self.instructions = instructions
    }
}
