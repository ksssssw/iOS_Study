//
//  DetailRepositoryProtocol.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

protocol DetailRepositoryProtocol {
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailEntity?
}
