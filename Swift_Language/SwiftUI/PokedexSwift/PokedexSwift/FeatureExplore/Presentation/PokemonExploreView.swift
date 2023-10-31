//
//  PokemonExploreView.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import SwiftUI

struct PokemonExploreView: View {
    let getPokemonListUseCase = GetPokemonListUseCase(pokeDexRepository: PokeDexRepository.shared)
    
    @State private var pokemonList: [PokemonEntity] = []
    @State private var offset: Int = 0
    let limit: Int = -0
    
    var body: some View {
        List {
            ForEach(pokemonList, id: \.self) { pokemon in
                PokemonListView(pokemon: pokemon)
                    .onAppear(perform: {
                        if pokemonList.last == pokemon {
                            loadMore()
                        }
                    })
            }
        }
        .task {
            loadMore()
        }
    }
    
    private func loadMore() {
        Task {
            do {
                let newPokemonList = try await getPokemonListUseCase.execute(limit: limit, offset: offset)
                pokemonList += newPokemonList
                
                offset += newPokemonList.count
            } catch {
                print("Error occurred: \(error)")
            }
        }
    }
}

#Preview {
    PokemonExploreView()
}
