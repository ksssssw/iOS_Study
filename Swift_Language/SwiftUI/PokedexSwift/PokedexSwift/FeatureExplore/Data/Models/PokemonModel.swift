//
//  PokemonModel.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

struct PokemonResponseModel: Decodable, Encodable {
    let name: String
    let url: String
}
