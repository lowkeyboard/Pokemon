//
//  ListRowView.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import SwiftUI

struct SpriteRow: View {
    @State private var Sprite = PokemonSprites()
    let imageSize: CGFloat = 40
    var url: String
    let weight: Int = 0
    
    var body: some View {
        HStack {
            if Sprite.front_default != nil {
                AsyncImage(url: URL(string: Sprite.front_default!)) { phase in
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
                               

            }else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            
            
        }
        .onAppear {
            //print("this is url_____\(self.url)")
            getSpriteImage(url: self.url)
        }

        
        
        
     
    }
    
    func getSpriteImage(url: String) {
        
        return NetworkingProvider.share.getSprite(url: url) { PokemonSprites in
            self.Sprite = PokemonSprites
        }
    }
}
