//
//  DetailsView.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import SwiftUI

struct DetailsView: View {
    let detailPokemon: Pokemon
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Details View \(detailPokemon.name)").font(.system(size: 22))
        }
        
    }
}




struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(detailPokemon: Pokemon.init( name: "pikacu", url: "url"))
    }
}
