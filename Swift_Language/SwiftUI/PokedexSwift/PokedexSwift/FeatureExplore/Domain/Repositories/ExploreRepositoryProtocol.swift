//
//  PokeDexRepositoryProtocol.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

protocol ExploreRepositoryProtocol {
    func fetchPokemons(limit: Int, offset: Int) async throws -> [PokemonEntity]
}
