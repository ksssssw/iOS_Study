//
//  PokemonDetailEntity.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import Foundation

struct PokemonDetailEntity {
    let pokemon: PokemonEntity
    let height: Int
    let weight: Int
    let stats: [PokemonStatsModel]
    
    init?(pokemonDetailResponse: PokemonDetailResponseModel) {
        guard let pokemon = PokemonEntity(pokemonDetailResponse: pokemonDetailResponse) else {
            return nil
        }
        
        self.pokemon = pokemon
        self.height = pokemonDetailResponse.height
        self.weight = pokemonDetailResponse.weight
        self.stats = pokemonDetailResponse.stats
    }
}
