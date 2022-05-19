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
    
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State var categoryIndex = 0
    @State var text = ""

    var body: some View {
        
        ZStack {
            VStack (alignment: .leading){
                HStack {
                    Image("menu")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                    
                    Image(systemName: "cart")
                        .font(.system(size: 20))
                        .foregroundColor(Color("Color4"))
                }
            }
            NavigationView {
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(searchText == ""
                                ? pokemon: pokemon.filter({$0.name.lowercased().contains(searchText.lowercased())})
                                , id:\.self ) {
                            pok in
                            HStack {

                                //SpriteRow(url: pok.url)
                                NavigationLink {
                                    DetailsView(detailPokemon: pok, index: self.getIndexOf(pok) )
                                } label: {
                                    PokemonCell(url: pok.url, name: pok.name, index: self.getIndexOf(pok))
                                }
                            }
                        }
                    }
                }
            }
            
            //                    .searchable(text: $searchText)
            //                    .navigationTitle("Pokemon List")
            
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


