//
//  CategoriesView.swift
//  Pokemon
//
//  Created by cagla copuroglu on 19.05.2022.
//

import SwiftUI

struct CategoriesView: View {

    var data: Int
    @Binding var index: Int
    var categories = ["Category1", "Category2", "Category3", "Category4"]

    var body: some View{
        VStack(spacing: 8 ){
            Text(categories[data])
                .font(.system(size: 18))
                .fontWeight(index == data ? .bold : .none)
                .foregroundColor(Color(index == data ? "mainfont" : "subfont"))
            
            Capsule()
                .fill(Color("mainfont"))
                .frame(width: 30, height: 4)
                .opacity(index == data ? 1 : 0)
        }.onTapGesture {
            withAnimation {
                index = data
            }
        }
    }
}
