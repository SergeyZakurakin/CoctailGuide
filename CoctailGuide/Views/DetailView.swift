//
//  DetailView.swift
//  CoctailGuide
//
//  Created by Sergey Zakurakin on 8/3/25.
//

import SwiftUI
import SwiftData


struct DetailView: View {
    @Environment(\.modelContext) private var modelContext
    let cocktail: Cocktail
    @StateObject private var vm = DetailViewModel()
    @State private var saved = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(cocktail.name)
                .font(.title)
            Text(cocktail.instructions)
                .font(.headline)
            VStack(alignment: .leading) {
                ForEach(cocktail.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .foregroundStyle(.brown)
                }
                Button(saved ? "Saved ✅" : "Add to favorites") {
                    vm.saveCocktail(cocktail: cocktail, context: modelContext)
                    saved = true
                }
                .disabled(saved)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    DetailView(cocktail: Cocktail(name: "Bloody Mary", ingredients: ["Vodka", "Tomato Juice", "Celery Sticks", "Lemon Wedge", "Olive", "Salt"], instructions: "Mix and serve"))
}
