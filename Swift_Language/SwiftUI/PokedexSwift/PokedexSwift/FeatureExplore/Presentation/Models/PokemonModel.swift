//
//  PokemonModel.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

struct PokemonModel: Hashable {
    let id: Int
    let name: String
    let imageURL: URL?
    
    init?(pokemon: PokemonEntity) {
        self.id = pokemon.id
        self.name = pokemon.name
        self.imageURL = URL(string: pokemon.imageURL)
    }
}
