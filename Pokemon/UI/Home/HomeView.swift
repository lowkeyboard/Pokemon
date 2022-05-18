//
//  HomeScreen.swift
//  Pokemon
//
//  Created by cagla copuroglu on 17.05.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    
    let pokemon = Pokemon( name: "pika", url: "urlpika")
    

    
    

    var body: some View {
    
        VStack {
            ScrollView{
                AppBarView()
                SearchBarView(text: $searchText)
            }
        }
        .onAppear {
            NetworkingProvider.share.getPokemons { pokemon in
                print(pokemon)
            } failure: { error in
                print(error)
            }

        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}


