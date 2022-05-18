//
//  ListRowView.swift
//  Pokemon
//
//  Created by cagla copuroglu on 18.05.2022.
//

import SwiftUI

struct SpriteRow: View {
    @State private var Sprite = PokemonSprites()
    let imageSize: CGFloat = 100
    @State private var url = ""
    let index: Int
    let weight: Int = 0
    
    var body: some View {
        HStack {
            
            if Sprite.front_default != nil {
                AsyncImage(url: URL(string: url)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                            .onAppear {
                                self.url =  getSpriteImage(index: self.index)
                            }
                        
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
            
            VStack(alignment: .leading, spacing: 5) {
                Text(Sprite.front_default ?? "nil")
                    .font(.headline)
                //Text( ?? "nil")
            }
            
            
            
        }
        
        
        
     
    }
    
    func getSpriteImage(index: Int) -> String {
        
        return NetworkingProvider.share.getSpriteImageUrl(index: index)
    }
}
