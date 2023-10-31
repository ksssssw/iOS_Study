//
//  PokeDexRepository.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

class PokeDexRepository: PokeDexRepositoryProtocol {
    static let shared = PokeDexRepository()
    
    private let pokeDexDataSources = PokeDexDataSource()
    
    
    func fetchPokemons(limit: Int, offset: Int) async throws -> [PokemonEntity] {
        let pokemonsListResponse = try await pokeDexDataSources.fetchPokemons(limit: limit, offset: offset)
        let pokemonResponses: [PokemonResponseModel] = pokemonsListResponse.results
        let pokemonEntities: [PokemonEntity] = pokemonResponses.compactMap { pokemon in
            return PokemonEntity(pokemonResponse: pokemon)
        }
        
        return pokemonEntities
    }
}
