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
        VStack(alignment: .center) {
            Text("Details View \(detailPokemon.name) at the index\(self.index)").font(.system(size: 22))
        }
        
    }
    
    func getSelectedDetails(index: Int){
        
    }
}




struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(detailPokemon: Pokemon.init( name: "pikacu", url: "url"), index: 2)
    }
}
