//
//  NetworkingProvider.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import Foundation

class NetworkingProvider {
    static let share = NetworkingProvider()

    func getPokemons( success: @escaping (_ pokemon: [Pokemon]) -> (), failure: @escaping (_ error: Error?) -> () ) {
        guard let url = URL(string: Service.Endpoint.allPokemonList) else { return }
        
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
}
