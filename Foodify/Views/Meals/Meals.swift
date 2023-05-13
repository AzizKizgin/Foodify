//
//  Meals.swift
//  Foodify
//
//  Created by Aziz Kızgın on 1.05.2023.
//

import SwiftUI

struct Meals: View {
    @ObservedObject var appViewModal = AppViewModal()
    @State var searchedMeals: [MealByCategory] = []
    @State var searchText = ""
    let text : String
    let color: Color
    var body: some View {
        VStack{
            ScrollView{
                Text(text)
                SearchBox(searchText: $searchText,onSearch: onSearch)
                ForEach(!searchedMeals.isEmpty ? searchedMeals : appViewModal.mealsByCategory){
                        meal in
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
            }.onAppear{
                appViewModal.getMealByCategory(category: text)
            }
        }
    }
    func onSearch(text: String){
        let filteredMeals = appViewModal.mealsByCategory.filter({$0.name.localizedCaseInsensitiveContains(text) })
        searchedMeals = filteredMeals
    }
}


struct Meals_Previews: PreviewProvider {
    static var previews: some View {
        Meals(text: "breakfast",color: Color(.red))
    }
}
