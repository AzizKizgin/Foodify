//
//  Meals.swift
//  Foodify
//
//  Created by Aziz Kızgın on 1.05.2023.
//

import SwiftUI

struct Meals: View {
    @ObservedObject var appViewModal = AppViewModal()
    @State var searchText = ""
    let text : String
    var body: some View {
        NavigationView{
            ScrollView{
                Text(text)
                SearchBox(searchText: $searchText)
                ForEach(appViewModal.mealsByCategory, id:\.id){
                    meal in
                    NavigationLink(destination: Home()){
                        ZStack{
                            RoundedRectangle(cornerRadius: 20,style: .continuous)
                                .fill(.red.opacity(0.4))
                            HStack() {
                                    AsyncImage(url: URL(string: meal.image)) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 150)
                                            .clipped()
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
            }.onAppear{
                appViewModal.getMealByCategory(category: text)
            }
        }.edgesIgnoringSafeArea(.top)
        
    }
}


struct Meals_Previews: PreviewProvider {
    static var previews: some View {
        Meals(text: "breakfast")
    }
}
