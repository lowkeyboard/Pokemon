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
//    @State private var flavorTextEntry = FlavorTextEntry(flavorText: "", language: Language(name: "", url: "")[], version: Language(name: "", url: ""))

    
    var body: some View {
        ZStack{
            ScrollView {
                
                Text(detailPokemon.name.uppercased())
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                
                ImageView(detailPokemon: self.detailPokemon, index: self.index)
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color(uiColor: .white), lineWidth: 5))
                
                Spacer(minLength: UIScreen.main.bounds.width * 0.2)
                
                DescriptionView()
                
                
                
            }
            
        }
        
        .padding()
        .background(Color("Color2"))
        .frame(maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea([.top, .bottom])
        
        
        
        .onAppear {
            NetworkingProvider.share.getSelectedDetails(index: self.index) { entry in
                guard let response = entry else { return
                }
                print(response.first)
                
                print(entry)
            } failure: { error in
                print(error)
            }

        }

    }
    
    
    
    
    
    
}





struct DescriptionView: View {
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("Characteristics")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            //                Info
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Size")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Treatment")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Jati Wood, Canvas, \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack {
                
                Button(action: {}) {
                    Image(systemName: "minus")
                        .padding(.all, 8)
                    
                }
                .frame(width: 30, height: 30)
                .overlay(RoundedCorner(radius: 50).stroke())
                .foregroundColor(.black)
                
                Text("1")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                
                //                        Plus Button
                
                
            }
        }
        .padding()
        .background(Color("Color2"))
        //        .cornerRadius(40)
        .offset(x: 0, y: -30.0)
    }
    
    
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(detailPokemon: Pokemon.init( name: "charizard", url: Service.allPokemonList+"/5"), index: 5)
    }
}
