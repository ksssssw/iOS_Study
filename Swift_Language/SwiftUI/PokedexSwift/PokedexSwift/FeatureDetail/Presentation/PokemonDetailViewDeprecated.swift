////
////  PokemonDetailView.swift
////  PokedexSwift
////
////  Created by 1000288 on 2023/10/31.
////
//
//import SwiftUI
//
//struct PokemonDetailView: View {
//    var id: Int
//    @State private var pokemonDetail: PokemonDetailEntity?
//    
//    var body: some View {
//        VStack {
//            if pokemonDetail == nil {
//                Text("Loading...")
//            } else {
//                AsyncImage(url: URL(string: pokemonDetail?.pokemon.imageURL ?? "")) { image in
//                    image
//                        .image?
//                        .resizable()
//                }
//                .scaledToFit()
//                
//                Text(pokemonDetail?.pokemon.name ?? "")
//                    .font(.title)
//                
//                Spacer()
//                
//                HStack {
//                    VStack {
//                        Text("\(pokemonDetail?.weight ?? 0) KG")
//                            .font(.title3)
//                        Text("Height")
//                            .font(.subheadline)
//                    }
//                    VStack {
//                        Text("\(pokemonDetail?.height ?? 0) M")
//                            .font(.title3)
//                        Text("Height")
//                            .font(.subheadline)
//                    }
//                }
//                
//                Spacer()
//                
//                VStack {
//                    Text("Base Stats")
//                        .font(.title2)
//                    
//                    HStack {
//                        Text("HP")
//                            .font(.headline)
//                        Text("\(pokemonDetail?.stats[0].base_stat ?? 0)")
//                    }
//                    HStack {
//                        Text("ATK")
//                            .font(.headline)
//                        Text("\(pokemonDetail?.stats[1].base_stat ?? 0)")
//                    }
//                    HStack {
//                        Text("DEF")
//                            .font(.headline)
//                        Text("\(pokemonDetail?.stats[2].base_stat ?? 0)")
//                    }
//                    HStack {
//                        Text("SPA")
//                            .font(.headline)
//                        Text("\(pokemonDetail?.stats[3].base_stat ?? 0)")
//                    }
//                    HStack {
//                        Text("SPD")
//                            .font(.headline)
//                        Text("\(pokemonDetail?.stats[4].base_stat ?? 0)")
//                    }
//                    
//                }
//            }
//        }
//        .task {
//            loadDetail(id: id)
//        }
//    }
//    
//    func loadDetail(id: Int) {
//        Task {
//            do {
//                let getPokemonDetailUseCase = GetPokemonDetailUseCase(repository: DetailRepository.shared)
//                
//                self.pokemonDetail = try await getPokemonDetailUseCase.execute(id: id)
//            } catch {
//                print("Error:\(error)")
//            }
//        }
//    }
//}
//
//#Preview {
//    PokemonDetailView(id: 1)
//}
