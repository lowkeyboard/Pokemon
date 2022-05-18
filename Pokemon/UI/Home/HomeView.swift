//
//  HomeScreen.swift
//  Pokemon
//
//  Created by cagla copuroglu on 17.05.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    
    @State private var  pokemon = [Pokemon]()
    
    
    var body: some View {
        
                NavigationView {
                    List {
                        ForEach(searchText == ""
                                ? pokemon: pokemon.filter({$0.name.lowercased().contains(searchText.lowercased())})
                         , id:\.self ) {
                            pok in
                            HStack {
                                Text("\(pok.name)")
                                NavigationLink {
                                    
                                    DetailsView(detailPokemon: pok)
                                } label: {
                                    SpriteRow( index: self.getIndexOf(pok))
                                    
                                }
                            }
                        }
                    }
                    .searchable(text: $searchText)
                    .navigationTitle("Pokemon List")

                }

        .onAppear {
            NetworkingProvider.share.getPokemons { pokemon in
                //print(pokemon)
                self.pokemon = pokemon
            } failure: { error in
                print(error)
            }

        }

    }
    
    func getIndexOf(_ pokemonMember: Pokemon) -> Int {
        if let ndx = pokemon.firstIndex(of: pokemonMember) {
            return Int(ndx)
        } else {
            return -1
        }
    }


}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}


