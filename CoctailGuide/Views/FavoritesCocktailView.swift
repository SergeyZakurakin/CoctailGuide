//
//  FavoritesCocktailView.swift
//  CoctailGuide
//
//  Created by Sergey Zakurakin on 8/3/25.
//

import SwiftUI
import SwiftData

struct FavoritesCocktailView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var savedCocktails: [SavedCocktail]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(savedCocktails, id: \.id) { cocktail in
                    let ingredients = cocktail.ingraineds
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(cocktail.name)
                            .font(.headline)
                        
                        Text(cocktail.instructions)
                            .font(.subheadline)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            ForEach(ingredients, id: \.self) { ingredient in
                                Text("• \(ingredient)")
                                    .foregroundStyle(.brown)
                            }
                        }
                    }
                    
                    .padding(.vertical, 8)
                    
                }
                .onDelete(perform: deleteCocktails)
            }
            
            .navigationTitle("Избранные коктейли")
        }
    }
    
    private func deleteCocktails(at offsets: IndexSet) {
        for index in offsets {
            let cocktail = savedCocktails[index]
            modelContext.delete(cocktail)
        }
    }
}

#Preview {
    FavoritesCocktailView()
        .modelContainer(for: SavedCocktail.self, inMemory: true)
}
