//
//  PokemonDetailResponseModel.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

struct PokemonDetailResponseModel: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
}
