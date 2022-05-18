//
//  ListView.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import SwiftUI

struct ListView: View {
    //let pokemans: [Pokemon]
    
    @State private var searchText: String = ""
//    
//    var filteredPokemons: [Pokemon] {
//        if searchText.count == 0 {
//          return pokemans
//        } else {
//            return pokemans.filter { $0.name.lowercased().contains(searchText.lowercased())
//            }
//        }
//    }

    var body: some View {
        Text("hello")
//        NavigationView {
//                    List {
//                        ForEach(filteredPokemons) { pokemonType in
//                        NavigationLink {
//                                DetailsView(detailPokemon: pokemonType)
//                            } label: {
//                                "LABEL"
//                            }
//
//                        }
//                    }
//                    .listStyle(PlainListStyle())
//                    .navigationTitle("Details of selected type")
//                    .searchable(text: $searchText)
//
//                }
 //   }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
}
