//
//  PokemonItemView.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import SwiftUI

struct PokemonItemView: View {
    var pokemon: PokemonEntity
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(.clear)
                .stroke(.black, style: .init())
            VStack {
                AsyncImage(url: URL(string: pokemon.imageURL)) { image in
                    image
                        .image?
                        .resizable()
                }
                .scaledToFit()
                .frame(width: 100, height: 100)
                
                Text(pokemon.name)
                
                Spacer()
            }
        }
        .padding(5)
    }
}

//#Preview {
//    PokemonItemView()
//}
