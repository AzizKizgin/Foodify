//
//  ContentView.swift
//  Foodify
//
//  Created by Aziz Kızgın on 29.04.2023.
//

import SwiftUI

struct Home: View {

    @ObservedObject var appViewModal = AppViewModal()
    @State var searchText = ""
    @State var meals:[Meal]?
    var body: some View {
        NavigationView{
            GeometryReader{
                proxy in
                let safeAreaTop = proxy.safeAreaInsets.top
                VStack(spacing:0){
                    VStack{
                        Header(safeAreaTop: safeAreaTop)
                    }
                    ScrollView{
                        SearchBox(searchText: $searchText,onSearch: onSearch)
                        if let meals = meals, !searchText.isEmpty{
                            ForEach(meals, id:\.id){
                                meal in
                                let color = categoryItemList.first(where: {$0.name == meal.category})?.color
                                MealItem(meal: meal, color: color ?? .gray)
                            }
                        }else{
                            CategoryList(categoryList: categoryItemList)
                        }
                    }
                }.edgesIgnoringSafeArea(.top)
            }
        }
    }
    func onSearch(text:String){
        appViewModal.searchMeal(name: text) { result,error in
            if error != nil {
                meals = nil
            }
            else{
                meals = result
            }
        }
    }
}




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
 
