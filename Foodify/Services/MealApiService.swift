//
//  MealApiService.swift
//  Foodify
//
//  Created by Aziz Kızgın on 29.04.2023.
//

import Foundation

class MealApiService {
    private func fetchData<T: Decodable>(endPoint: String, completion: @escaping (T?, Error?) -> Void) {
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
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }

    
    func searchMealByName(name: String, completion: @escaping ([Meal]?, Error?) -> Void) {
        let url = Urls.search+"?s=\(name)"
        fetchData(endPoint: url){
        (result:MealResponse?, error) in
            guard let mealsResponse = result else {
                completion(nil, error)
                return
            }
            completion(mealsResponse.meals, nil)
        }
    }
    
    func searchMealById(id:Int,completion: @escaping (Meal?, Error?) -> Void){
        let url = Urls.detailById+"?i=\(id)"
        fetchData(endPoint: url){
            (result:MealResponse?, error) in
            guard let mealResponse = result else{
                completion(nil,error)
                return
            }
            completion(mealResponse.meals[0],nil)
        }
    }
    
    func searchMealByCategory(category:String,completion: @escaping ([MealByCategory]?,Error?) -> Void){
        let url = Urls.filter+"?c=\(category)"
        fetchData(endPoint: url){
            (result:MealByCategoryResponse?, error )in
            guard let mealsResponse = result else{
                completion(nil,error)
                return
            }
            completion(mealsResponse.meals,nil)
        }
    }
}

