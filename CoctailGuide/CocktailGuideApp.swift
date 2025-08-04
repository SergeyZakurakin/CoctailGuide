//
//  CocktailGuideApp.swift
//  CoctailGuide
//
//  Created by Sergey Zakurakin on 8/3/25.
//

import SwiftUI
import SwiftData

@main
struct CocktailGuideApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: SavedCocktail.self)
    }
}
