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

struct PokemonDescription: Codable {
    let flavor_text_entries: [FlavorTextEntries]
}
struct FlavorTextEntries: Codable {
    let flavor_text: String
    let language: Language
}


// MARK: - Language
struct Language : Codable{
    var name: String?
    var url: String?
}

// MARK: - Language
struct Version : Codable{
    var name: String?
    var url: String?
}
