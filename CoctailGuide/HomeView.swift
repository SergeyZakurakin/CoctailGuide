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
            VStack {
                TextField("Search", text: $search)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    Task {
                        await vm.searchCoctails(name: search)
                    }
                } label: {
                    Text("Start Search")
                }
                
                List {
                    ForEach(vm.coctails, id: \.name) { coctail in
                        VStack {
                            NavigationLink(coctail.name) {
                                Text(coctail.name)
                            }
                            Text(coctail.instructions)
                                .foregroundStyle(.red)
                            ForEach (coctail.ingredients, id: \.self) { ingredient in
                                Text(ingredient)
                            }
                            
                        }
                    }
                }
                
            }
            .navigationTitle("CocktailGuide")
            .navigationBarTitleDisplayMode(.inline)
        }
     
    }
}

#Preview {
    HomeView()
}
