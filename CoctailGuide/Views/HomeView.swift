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
            VStack(spacing: 20) {
                ZStack(alignment: .bottom) {
                    Image(.cocktail)
                        .resizable()
                        .frame(height: 300)
                        .scaledToFit()
                    
                    Text("Cocktail Guide")
                        .foregroundStyle(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .opacity(0.5)
                        .padding(.bottom, 20)
                }
                TextField("Tap Cocktail name here", text: $search)
                    .padding(6)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.gray)
                            .opacity(0.2)
                    )
                    .padding(.horizontal)
                
                Button {
                    Task {
                        await vm.searchCocktails(name: search)
                    }
                } label: {
                    Text("Search")
                        .foregroundStyle(.black)
                        .padding(6)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.gray)
                        )
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
            }
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        FavoritesCocktailView()
                    } label: {
                        Image(systemName: "bookmark")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
