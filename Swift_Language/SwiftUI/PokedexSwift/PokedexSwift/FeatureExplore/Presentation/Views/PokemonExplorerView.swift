//
//  PokemonExplorerView.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import SwiftUI

struct PokemonExplorerView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @StateObject private var viewModel: PokemonExploreViewModel = PokemonExploreViewModel()
    
        var body: some View {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.pokemonList, id: \.self) { pokemon in
                            NavigationLink(destination: PokemonDetailView(id: pokemon.id)) {
                                PokemonListView(pokemon: pokemon)
                                    .onAppear(perform: {
                                        viewModel.handleOnAppear(pokemon: pokemon)
                                    })
                            }
                        }
                    }
                    .task {
                        viewModel.loadPokemonList()
                    }
                }
            }
        }
}

#Preview {
    PokemonExplorerView()
}
