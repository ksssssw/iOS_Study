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
            .offset(y: 60)
            .overlay(
                ZStack {
                    Color.clear
                        .background(Color(hex: 0xf00000))
                    
                    Text("PokeDex")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.bottom, 20)
                        .padding(.leading, 20)
                }
                    .frame(height: 50)
                    .frame(maxHeight: .infinity, alignment: .top)
            )
            .background(Color(hex: 0x222224))
        }
    }
}

#Preview {
    PokemonExplorerView()
}
