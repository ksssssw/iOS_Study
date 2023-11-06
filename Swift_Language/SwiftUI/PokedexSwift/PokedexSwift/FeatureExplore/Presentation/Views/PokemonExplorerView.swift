//
//  PokemonExplorerView.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import SwiftUI

struct PokemonExplorerView: View {
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 20)]
    
    @StateObject private var viewModel: PokemonExploreViewModel = PokemonExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.pokemonList, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(id: pokemon.id)) {
                            PokemonListView(pokemon: pokemon)
                                .onAppear(perform: {
                                    viewModel.handleOnAppear(pokemon: pokemon
                                    )
                                }
                            )
                        }
                    }
                }
                .padding()
                .task {
                    viewModel.loadPokemonList()
                }
            }
            .background(Color(hex: 0x222224))
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    PokemonExplorerView()
}
