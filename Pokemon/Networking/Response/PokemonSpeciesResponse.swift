//
//  PokemonBreedResponse.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - PokemonSpeciesResponse
struct PokemonSpeciesResponse : Decodable {
    var flavorTextEntries: [FlavorTextEntry]?
}


// MARK: - FlavorTextEntry
struct FlavorTextEntry : Codable {
    
    var flavorText: String?
    var language, version: String?
}