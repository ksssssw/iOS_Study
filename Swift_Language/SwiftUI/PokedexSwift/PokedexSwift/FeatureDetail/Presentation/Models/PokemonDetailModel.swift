//
//  PokemonDetailModel.swift
//  PokedexSwift
//
//  Created by SeokWonKang on 10/31/23.
//

import Foundation

struct PokemonDetailModel {
    
    let pokemon: PokemonModel
    let height: Int
    let weight: Int
    let stats: [PokemonStatsModel]
    
    init?(pokemonDetail: PokemonDetailEntity) {
        guard let pokemon = PokemonModel(pokemon: pokemonDetail.pokemon) else {
            return nil
        }
        
        self.pokemon = pokemon
        self.height = pokemonDetail.height
        self.weight = pokemonDetail.weight
        self.stats = pokemonDetail.stats
    }
}
