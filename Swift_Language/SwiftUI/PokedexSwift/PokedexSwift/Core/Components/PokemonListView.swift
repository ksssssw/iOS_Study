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
        HStack {
            AsyncImage(url: URL(string: pokemon.imageURL)) { image in
                image
                    .image?
                    .resizable()
            }
            .scaledToFit()
            .frame(width: 100, height: 100)

            Text(pokemon.name)
        }
    }
}

//#Preview {
//    PokemonListView()
//}
