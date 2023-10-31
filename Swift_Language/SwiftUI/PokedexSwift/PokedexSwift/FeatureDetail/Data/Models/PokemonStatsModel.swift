//
//  PokemonStatsModel.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

struct PokemonStatsModel: Decodable, Encodable {
    let base_stat: Int
    let effort: Int
    let stat: PokemonStatModel
}
