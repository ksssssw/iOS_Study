//
//  GetPokemonListUseCase.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

class GetPokemonListUseCase {
    let pokeDexRepository: PokeDexRepositoryProtocol
    
    init(pokeDexRepository: PokeDexRepositoryProtocol) {
        self.pokeDexRepository = pokeDexRepository
    }
    
    func execute(limit: Int, offset: Int) async throws -> [PokemonEntity] {
        return try await pokeDexRepository.fetchPokemons(limit: limit, offset: offset)
    }
}
