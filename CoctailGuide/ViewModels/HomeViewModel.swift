//
//  HomeViewModel.swift
//  CoctailGuide
//
//  Created by Sergey Zakurakin on 8/3/25.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    
    func searchCocktails(name: String) async {
        let result = await NetworkManager.shared.fetchCoctails(name: name)
        cocktails = result
    }
}
