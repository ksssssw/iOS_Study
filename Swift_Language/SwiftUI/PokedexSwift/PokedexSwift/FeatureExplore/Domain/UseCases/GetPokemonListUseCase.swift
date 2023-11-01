//
//  GetPokemonListUseCase.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

class GetPokemonListUseCase {
    let exploreRepository: ExploreRepositoryProtocol
    
    init(exploreRepository: ExploreRepositoryProtocol) {
        self.exploreRepository = exploreRepository
    }
    
    func execute(limit: Int, offset: Int) async throws -> [PokemonEntity] {
        return try await exploreRepository.fetchPokemons(limit: limit, offset: offset)
    }
}
