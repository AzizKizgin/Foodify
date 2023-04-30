//
//  MealApiService.swift
//  Foodify
//
//  Created by Aziz Kızgın on 29.04.2023.
//

import Foundation

class MealApiService {
    private func fetchMeals(endPoint: String, completion: @escaping ([Meal]?, Error?) -> Void) {
        guard let url = URL(string: endPoint) else {
            completion(nil, NSError(domain: "", code: -1, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil, error)
                return
            }

            do {
                let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                let meals = mealResponse.meals
                completion(meals, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    func searchMealByName(name: String, completion: @escaping ([Meal]?, Error?) -> Void) {
        let url = Urls.search+"?s=\(name)"
        fetchMeals(endPoint: url){
            result, error in
            guard let meals = result else {
                completion(nil, error)
                return
            }
            completion(meals, nil)
        }
    }
    
    func searchMealById(id:Int,completion: @escaping (Meal?, Error?) -> Void){
        let url = Urls.detailById+"?i=\(id)"
        fetchMeals(endPoint: url){
            result, error in
            guard let meal = result else{
                completion(nil,error)
                return
            }
            completion(meal[0],nil)
        }
    }
}

