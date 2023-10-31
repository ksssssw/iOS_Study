//
//  PokemonDetailView.swift
//  PokedexSwift
//
//  Created by SeokWonKang on 10/31/23.
//

import SwiftUI

struct PokemonDetailView: View {
    var id: Int
    
    @StateObject private var viewModel: PokemonDetailViewModel = PokemonDetailViewModel()
    
    var body: some View {
        VStack {
            if viewModel.pokemonDetail == nil {
                Text("Loading...")
            } else {
                AsyncImage(url: viewModel.pokemonDetail?.pokemon.imageURL) { image in
                    image
                        .image?
                        .resizable()
                }
                .scaledToFit()
                
                Text(viewModel.pokemonDetail?.pokemon.name ?? "")
                    .font(.title)
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("\(viewModel.pokemonDetail?.weight ?? 0) KG")
                            .font(.title3)
                        Text("Height")
                            .font(.subheadline)
                    }
                    VStack {
                        Text("\(viewModel.pokemonDetail?.height ?? 0) M")
                            .font(.title3)
                        Text("Height")
                            .font(.subheadline)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("Base Stats")
                        .font(.title2)
                    
                    HStack {
                        Text("HP")
                            .font(.headline)
                        Text("\(viewModel.pokemonDetail?.stats[0].base_stat ?? 0)")
                    }
                    HStack {
                        Text("ATK")
                            .font(.headline)
                        Text("\(viewModel.pokemonDetail?.stats[1].base_stat ?? 0)")
                    }
                    HStack {
                        Text("DEF")
                            .font(.headline)
                        Text("\(viewModel.pokemonDetail?.stats[2].base_stat ?? 0)")
                    }
                    HStack {
                        Text("SPA")
                            .font(.headline)
                        Text("\(viewModel.pokemonDetail?.stats[3].base_stat ?? 0)")
                    }
                    HStack {
                        Text("SPD")
                            .font(.headline)
                        Text("\(viewModel.pokemonDetail?.stats[4].base_stat ?? 0)")
                    }
                    
                }
            }
        }
        .task {
            viewModel.loadDetail(id: id)
        }
    }
}

#Preview {
    PokemonDetailView(id: 1)
}
