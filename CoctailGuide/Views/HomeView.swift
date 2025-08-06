//
//  ContentView.swift
//  CoctailGuide
//
//  Created by Sergey Zakurakin on 8/3/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    @State private var search = ""
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Image(.cocktail)
                    .resizable()
                    .frame(height: 300)
                
                VStack {
                    TextField("Search", text: $search)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        Task {
                            await vm.searchCocktails(name: search)
                        }
                    } label: {
                        Text("Start Search")
                    }
                    
                    List {
                        ForEach(vm.cocktails, id: \.name) { cocktail in
                            VStack {
                                NavigationLink(cocktail.name) {
                                    DetailView(cocktail: cocktail)
                                }
                            }
                        }
                    }
                    NavigationLink("Favorite") {
                        FavoritesCocktailView()
                    }
                    
                }
                .navigationTitle("CocktailGuide")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    HomeView()
}
