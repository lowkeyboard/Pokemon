//
//  AppBarView.swift
//  Pokemon
//
//  Created by cagla copuroglu on 17.05.2022.
//

import SwiftUI

struct AppBarView: View {
    var body: some View {
        
        VStack (alignment: .leading, spacing: 8){
            HStack(alignment: .lastTextBaseline, spacing: 6) {
                Text("  Pokedex").font(.system(size: 30)).fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            Text("    Search for a Pokeman").font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)

        }
    }
}




struct AppBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView()
    }
}
