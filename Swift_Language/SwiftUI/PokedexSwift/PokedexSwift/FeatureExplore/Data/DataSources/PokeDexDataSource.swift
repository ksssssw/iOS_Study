//
//  PokeDexDataSource.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

class PokeDexDataSource {
    func fetchPokemons(limit: Int, offset: Int) async throws -> PokemonListResponseModel {
        guard let url: URL = Constants.APIEndpoint.getPokemonList(limit: limit, offset: offset).url else {
            throw URLError(.badURL)
        }
        
        return try await NetworkUtils.shared.fetch(from: url)
    }
}
