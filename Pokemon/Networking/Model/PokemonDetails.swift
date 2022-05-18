//
//  File.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import Foundation

struct PokemonDetails : Codable {
    var sprites: PokemonSprites
    var weight: Int
    
    //todo: codable versions needed for further details.
    var abilities: String?
    var forms: String?
    var gameIndices: String?
    var moves: String?

    var species: String?
//    var sprites: String?
    var stats: String?
    var types: String
}

struct PokemonSprites : Codable {

    var front_default: String?
    
}
