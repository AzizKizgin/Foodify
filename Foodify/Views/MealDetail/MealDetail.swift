//
//  MealDetail.swift
//  Foodify
//
//  Created by Aziz Kızgın on 3.05.2023.
//

import SwiftUI

struct MealDetail: View {
    @Environment(\.presentationMode) var presentationMode
    let id: String
    @StateObject var appViewModal = AppViewModal()
    var body: some View {
        VStack(spacing:0){
            if let meal = appViewModal.meal {
                ScrollView{
                    VStack{
                        AsyncImage(url: URL(string: meal.image)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 250)
                                .clipped()
                            
                        } placeholder: {
                            ProgressView()
                        }
                        
                    }
                    VStack{
                        VStack(spacing: 10){
                            Text(meal.name)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .bold()
                                .font(.system(size: 25))
                            Text(meal.instructions)
                        }
                        VStack{
                            Text("Ingredients")
                                .bold()
                                .font(.system(size: 20))

                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    }
                    .padding(20)
                }
            }
        }.onAppear{
            appViewModal.getMealById(id: Int(id) ?? 0)
        }
        .foregroundColor(.black)
        
        
    }
}

struct MealDetail_Previews: PreviewProvider {
    static var previews: some View {
        MealDetail(id:"52772")
    }
}
