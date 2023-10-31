//
//  PokemonDetailView.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import SwiftUI

struct PokemonDetailView: View {
    var id: Int
    @State private var pokemonDetail: PokemonDetailEntity?
    
    var body: some View {
        VStack {
            if pokemonDetail == nil {
                Text("Loading...")
            } else {
                AsyncImage(url: URL(string: pokemonDetail?.pokemon.imageURL ?? "")) { image in
                    image
                        .image?
                        .resizable()
                }
                .scaledToFit()
                
                Text(pokemonDetail?.pokemon.name ?? "")
                    .font(.title)
                
                HStack {
                    Text("Height: \(pokemonDetail?.height ?? 0)")
                        .font(.subheadline)
                    Text("Weight: \(pokemonDetail?.weight ?? 0)")
                        .font(.subheadline)
                }
            }
        }
        .task {
            loadDetail(id: id)
        }
    }
    
    func loadDetail(id: Int) {
        Task {
            do {
                let getPokemonDetailUseCase = GetPokemonDetailUseCase(repository: DetailRepository.shared)
                
                self.pokemonDetail = try await getPokemonDetailUseCase.execute(id: id)
            } catch {
                print("Error:\(error)")
            }
        }
    }
}

#Preview {
    PokemonDetailView(id: 1)
}