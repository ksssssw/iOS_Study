//
//  ContentView.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/10/30.
//

import SwiftUI

// 이 데이터 모델은 엔티티와 UI 관련 정보를 혼합해서 사용중임
// 클린아키텍처에서는 엔티티와 UI 종속성이 없어야 함
struct Pokemon: Identifiable, Decodable {
    let id: Int
    let name: String
    // 이미지 URL 생성과 같은 UI작업은 분리되어야 함 이 부분은 UI레이어나 ViewModel에서 수행될 수 있음
    var imageUrl: URL? {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")
    }
}

struct PokemonList: Decodable {
    let results: [PokemonResult]
}

struct PokemonResult: Decodable {
    let name: String
    let url: String
}

struct ContentView: View {
    @State private var pokemonList: [Pokemon] = []
    
    var body: some View {
        List {
            ForEach(pokemonList) { pokemon in
                PokemonView(pokemon: pokemon)
            }
        }
        // 뷰 내부에서 데이터를 직접 가져오는것은 클린아키텍처에서 위배됨
        // 데이터 가져오는 작업은 ViewModel이나 사용 사례와 같은 별도의 레이어로 이동되어야 함
        .task {
            do {
                pokemonList = try await getPokemonList()
            } catch {
                print("error")
            }
        }
    }
    
    // 이 함수는 1. 데이터를 가져오고 2. 파싱하고, 3. 데이터를 변환하는 작업이 모두 합쳐져 있음
    // 이 문제는 단일 책임 원칙에 따라 분리되어야 함
    func getPokemonList() async throws -> [Pokemon] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=50") else {
            throw URLError(.badURL)
        }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        var pokemons = [Pokemon]()
        
        let pokemonList = try JSONDecoder().decode(PokemonList.self, from: data)
        
        for (index, result) in pokemonList.results.enumerated() {
            let pokemon = Pokemon(id: index + 1, name: result.name)
            pokemons.append(pokemon)
        }
        
        return pokemons
    }
}

struct PokemonView: View {
    var pokemon: Pokemon
    
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.imageUrl) { image in
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

#Preview {
    ContentView()
}
