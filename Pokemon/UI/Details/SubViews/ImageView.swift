//
//  ImageView.swift
//  Pokemon
//
//  Created by cagla copuroglu on 19.05.2022.
//

import SwiftUI

struct ImageView: View {
    let detailPokemon: Pokemon
    let index: Int
    let imageSize: CGFloat = 100

    var body: some View {
        AsyncImage(url: URL(string: "\(Service.baseUrlImageSprite)\(index+1).png")) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2, alignment: .topLeading)
                    .cornerRadius(55)
                    .background(.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
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
