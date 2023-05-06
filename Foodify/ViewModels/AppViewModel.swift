//
//  HomeViewModel.swift
//  Foodify
//
//  Created by Aziz Kızgın on 29.04.2023.
//

import Foundation

class AppViewModal: ObservableObject {
    @Published var categories: [Category] = []
    @Published var meals: [Meal] = []
    @Published var mealsByCategory: [MealByCategory] = []
    @Published var meal: Meal? = nil
    private let categoryService = CategoryApiService()
    private let mealService = MealApiService()
    func fetchCategories(){
        categoryService.fetchCategories{
            result,error  in
            guard let categories = result else{
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.categories = categories
            }
        }
    }
    
    func searchMeal(name:String,completion: @escaping ([Meal]?, Error?) -> Void){
        mealService.searchMealByName(name: name){
            result, error in
            guard let meals = result else{
                completion(nil, error)
                return
            }
            DispatchQueue.main.async {
                self.meals = meals
                completion(meals,nil)
            }
        }
    }
    
    func getMealById(id:Int){
        mealService.searchMealById(id:id){
            result, error in
            guard let meal = result else{
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.meal = meal
            }
        }
    }
    
    func getMealByCategory(category:String){
        mealService.searchMealByCategory(category: category){
            result ,error in
            guard let meals = result else {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.mealsByCategory = meals
            }
        }
    }
    
}
