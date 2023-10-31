//
//  PokemonListView.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import SwiftUI

struct PokemonListView: View {
    var pokemon: PokemonEntity

    var body: some View {
        PokemonItemView(pokemon: pokemon)
    }
}

//#Preview {
//    PokemonListView(pokemon: PokemonEntity)
//}
