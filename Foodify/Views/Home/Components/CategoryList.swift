//
//  CategoryList.swift
//  Foodify
//
//  Created by Aziz Kızgın on 2.05.2023.
//

import SwiftUI

struct CategoryList: View {
    let categoryList: [CategoryListItem]
    var body: some View {
        ForEach(categoryList, id:\.id){
            category in
            NavigationLink(destination: Meals(text:"\(category.name)", color:category.color)){
                ZStack{
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .fill(category.color)
                    VStack(spacing: 8){
                        Text(category.name)
                            .font(.system(size: 32))
                            .foregroundColor(.black)
                        Text("\(category.mealCount) recipe")
                            .foregroundColor(.black)
                        Spacer()
                        Image(category.name.lowercased())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame( width: 175)
                    }.padding()
                }
                .frame(height:250)
                 .padding(.horizontal)
                .padding(.vertical,10)
            }
        }
    }
}

