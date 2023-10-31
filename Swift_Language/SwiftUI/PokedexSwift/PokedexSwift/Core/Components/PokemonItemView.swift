//
//  PokemonItemView.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import SwiftUI

struct PokemonItemView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(.clear)
                .stroke(.black, style: .init())
                .padding(10)
            VStack {
//                AsyncImage(url: URL(string: pokemon.imageURL)) { image in
//                    image
//                        .image?
//                        .resizable()
//                }
//                .scaledToFit()
//                .frame(width: 100, height: 100)
                
//                Text(pokemon.name)
                Text("포켓몬 이름")
            }
        }
    }
}

#Preview {
    PokemonItemView()
}
