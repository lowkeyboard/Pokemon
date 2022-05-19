//
//  DetailsView.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import SwiftUI

struct DetailsView: View {
    let detailPokemon: Pokemon
    let index: Int

    var body: some View {
        
        ScrollView {
                
                Text(" \(detailPokemon.name)")
                    .foregroundColor(.purple)
                
                    .fontWeight(.heavy)
                    .font(.monospaced(.largeTitle)())
                
                Spacer()
                Text("#\(self.index) ")
                    .font(.monospaced(.title2)())
                
            

            ImageView(detailPokemon: self.detailPokemon, index: self.index)
            Text("sdasdas")


        }
        
        
    }
    
    func getSelectedDetails(index: Int){
        
    }
}




struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(detailPokemon: Pokemon.init( name: "charizard", url: Service.Endpoint.allPokemonList+"/5"), index: 5)
    }
}
