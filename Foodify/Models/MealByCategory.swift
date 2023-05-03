//
//  MealByCategory.swift
//  Foodify
//
//  Created by Aziz Kızgın on 2.05.2023.
//

import Foundation

struct MealByCategory: Codable, Identifiable{
    let name: String
    let image: String
    let categoryId: String
    
    enum CodingKeys: String, CodingKey{
        case categoryId = "idMeal"
        case name = "strMeal"
        case image = "strMealThumb"
    }
    
    
    var id: String{
        categoryId
    }
}

struct MealByCategoryResponse: Decodable {
    let meals: [MealByCategory]
}
