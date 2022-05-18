//
//  HomeViewModel.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import Foundation
class HomeViewModel {

    var pokemons: [Pokemon] = []
    
    func getPokemons( success: @escaping () -> (), failure: @escaping (_ error: Error?) -> ()) {
        NetworkingProvider.share.getPokemons(success: { pokemon in
            print(pokemon)
            //self.pokemons = pokemons.
            success()
        }, failure: { error in
            failure(error)
        })
    }

    

}
