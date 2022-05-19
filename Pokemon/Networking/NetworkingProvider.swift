//
//  NetworkingProvider.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import Foundation

class NetworkingProvider : APIServiceProtocol {
    static let share = NetworkingProvider()

    // General request to retrieve all pokemons.
    func getPokemons( success: @escaping (_ pokemon: [Pokemon]) -> (), failure: @escaping (_ error: Error?) -> () ) {
        guard let url = URL(string: Service.allPokemonList+"?limit=100") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if (data?.isEmpty == false) {
                let pokemonDecoded = try! JSONDecoder().decode(PokemonResponse.self, from: data!)
                
                DispatchQueue.main.async {
                    success(pokemonDecoded.results)
                }

            } else {
                print("no DATA from pokemon api ")
            }
            
        }.resume()
    }
    
    //MARK - DetailView Requests
    // example: https://pokeapi.co/api/v2/pokemon-species/5
    
    func getSelectedDetails(index: Int, success: @escaping (_ flavorTextEntry: String?) -> (), failure: @escaping (_ error: Error?) -> () ) {
        guard let url = URL(string: Service.detailedSpecies + "\(index+1)") else { return }
        print("URL_________=\(url)")
        URLSession.shared.dataTask(with: url) { data, response, error in
            if (data?.isEmpty == false) {
//                let pokemonDecoded = try! JSONDecoder().decode(PokemonSpeciesResponse.self, from: data!)
                print(data)
                   let pokemonDecoded = try! JSONDecoder().decode(PokemonSpeciesResponse.self, from: data!)

                DispatchQueue.main.async {
                    
                    success("pokemonDecoded.flavor_text_entries")
                }

            } else {
                print("no DATA from pokemon api ")
                failure(error)
            }
            
        }.resume()
    }

    
    
    func getSprite(url: String, success: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            if (data.isEmpty == false) {

            let pokemonSpriteDecoded = try! JSONDecoder().decode(PokemonSpriteResponse.self, from: data)
                
                DispatchQueue.main.async {
                    success(pokemonSpriteDecoded.sprites)
                }

            } else {
                print("no DATA from pokemon detail api ")
            }

        }.resume()
        
        
    }
    
    //MARK: One of the ways to access a pokemon character's sprite image,
    // add {index+1} value at the end of the request url.
    // the index number can be obtained from allPokemonList response.
    
//    func getSpriteImageUrl(index: Int) -> String {
//
//        let spriteImageUrl = Service.baseUrlImageSprite + "\(index+1)" + ".png"
//
//        return spriteImageUrl
//
//    }
}
