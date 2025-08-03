//
//  Coctail.swift
//  CoctailGuide
//
//  Created by Sergey Zakurakin on 8/3/25.
//

import Foundation

struct Coctail: Codable {
    let name: String
    let ingredients: [String]
    let instructions: String
}
