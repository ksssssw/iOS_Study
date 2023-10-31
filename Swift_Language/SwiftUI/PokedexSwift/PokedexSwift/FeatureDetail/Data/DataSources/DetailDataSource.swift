//
//  DetailDataSource.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

class DetailDataSource {
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailResponseModel {
        guard let url: URL = Constants.APIEndpoint.getPokemonDetail(id: id).url else {
            throw URLError(.badURL)
        }
        
        return try await NetworkUtils.shared.fetch(from: url)
    }
}
