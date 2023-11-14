//
//  PokemonItemView.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/31.
//

import SwiftUI

struct PokemonItemView: View {
    var pokemon: PokemonModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(hex: 0xFBCEB1))
                .frame(width: 170, height: 200)
                .shadow(radius: 3)
            
            VStack {
                CacheAsyncImage(url: pokemon.imageURL!) { image in
                    image
                        .image?
                        .resizable()
                }
                .scaledToFit()
                .frame(width: 130, height: 130)
                
                ZStack(alignment: .leading) {
                    Text(pokemon.name)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
}

//#Preview {
//    PokemonItemView(pokemon: PokemonModel(pokemon: <#T##PokemonEntity#>))
//}
