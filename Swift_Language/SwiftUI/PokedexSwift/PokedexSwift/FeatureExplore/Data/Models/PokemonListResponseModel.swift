//
//  PokemonListResponseModel.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

struct PokemonListResponseModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonResponseModel]
}
