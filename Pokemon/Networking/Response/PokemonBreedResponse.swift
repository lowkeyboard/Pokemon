//
//  PokemonBreedResponse.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import Foundation

class PokemonBreedResponse: Codable {
    //    var abilities: [Ability]
        var base_experience: Int
     //   var forms: [Form]
    //    var gameIndices: [GameIndices]
        var height: Int
    //var held_items
    
        var moves: String?
    
        var species: String?
        var sprites: String?
        var stats: String?
        var types: String
}
