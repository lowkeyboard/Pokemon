//
//  Pokemon.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import Foundation


struct Pokemon : Codable, Identifiable, Equatable, Hashable {
    let id =  UUID()
    let name: String
    let url: String
    

}
