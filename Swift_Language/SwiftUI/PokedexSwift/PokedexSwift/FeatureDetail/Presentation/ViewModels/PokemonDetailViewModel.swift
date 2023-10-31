//
//  PokemonDetailViewModel.swift
//  PokedexSwift
//
//  Created by SeokWonKang on 10/31/23.
//

import Foundation

@MainActor
class PokemonDetailViewModel: ObservableObject {
    let getPokemonDetailUseCase = GetPokemonDetailUseCase(repository: DetailRepository())
    
    @Published var pokemonDetail: PokemonDetailModel?
    
    func loadDetail(id: Int) {
        Task {
            do {
                guard let pokemonDetailEntity: PokemonDetailEntity = try await getPokemonDetailUseCase.execute(id: id) else {
                    return
                }
                self.pokemonDetail = PokemonDetailModel(pokemonDetail: pokemonDetailEntity)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
