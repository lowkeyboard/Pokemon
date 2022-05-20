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
    
    
    //MARK - DetailView Request
    // example: https://pokeapi.co/api/v2/pokemon-species/5
    
    func getFlavorTextEntry(index: Int, success: @escaping (_ flavorTextEntry: String?) -> (), failure: @escaping (_ error: Error?) -> () ) {
        guard let url = URL(string: "\(Service.detailedSpecies)\(index)") else { return }
        print("URL_________=\(url)")
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(PokemonDescription.self, from: data)
                DispatchQueue.main.async {
                    // Check and get first pokemon description in English
                    for index in 0..<result.flavor_text_entries.count {
                        if result.flavor_text_entries[index].language.name == "en" {
                             success(result.flavor_text_entries[index].flavor_text)
                        }
                    }
                    
                    
                }
            } catch let error { print(error) }
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
    
}
