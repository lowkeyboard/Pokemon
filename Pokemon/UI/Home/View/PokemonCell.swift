//
//  PokemonCell.swift
//  Pokemon
//
//  Created by cagla copuroglu on 19.05.2022.
//

import SwiftUI

struct PokemonCell: View {
    var url: String
    var name: String
    let index: Int
    let imageSize: CGFloat = 64
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    Text("#\(index)")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    
                    
                    AsyncImage(url: URL(string:"\(Service.baseUrlImageSprite)\(index+1).png")) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFill()
                                .frame(width: imageSize, height: imageSize)
                                .clipped()
                            
                            
                        } else if phase.error != nil {
                            
                            Text(phase.error?.localizedDescription ?? "error")
                                .foregroundColor(Color.pink)
                                .frame(width: imageSize, height: imageSize)
                        } else {
                            ProgressView()
                                .frame(width: imageSize, height: imageSize)
                        }
                        
                    }
                }
            }
        }
        
        .background(Color.orange)
        .cornerRadius(12)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(url: Service.Endpoint.allPokemonList+"/5", name: "charizard", index: 5)
    }
}
