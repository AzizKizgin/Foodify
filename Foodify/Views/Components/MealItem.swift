//
//  MealItem.swift
//  Foodify
//
//  Created by Aziz Kızgın on 7.05.2023.
//

import SwiftUI

struct MealItem: View {
    let meal: Meal
    let color: Color
    var body: some View {
        NavigationLink(destination: MealDetail(id: meal.id)){
            ZStack{
                RoundedRectangle(cornerRadius: 20,style: .continuous)
                    .fill(color)
                HStack() {
                        AsyncImage(url: URL(string: meal.image)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 160)
                                .clipped()
                                .cornerRadius(20)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(meal.name)
                            .font(.system(size: 21))
                            .foregroundColor(.white)
                            .lineLimit(10)
                            .truncationMode(.tail)
                            .frame(maxWidth: 150)
                 
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height:200)
            .padding(.horizontal)
            .padding(.vertical,10)
        }
    }
}
