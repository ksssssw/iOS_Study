//
//  GetPokemonDetailUseCase.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

class GetPokemonDetailUseCase {
    let repository: DetailRepositoryProtocol
    
    init(repository: DetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> PokemonDetailEntity? {
        guard let pokemonDetail: PokemonDetailEntity = try await repository.fetchPokemonDetail(id: id) else {
            return nil
        }
        
        return pokemonDetail
    }
}
