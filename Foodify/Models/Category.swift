//
//  Category.swift
//  Foodify
//
//  Created by Aziz Kızgın on 30.04.2023.
//

import Foundation

struct Category: Codable, Identifiable{
    let categoryId: String
    let name: String
    let image: String
    let description: String
    
    enum CodingKeys: String, CodingKey{
        case categoryId = "idCategory"
        case name = "strCategory"
        case image = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
    
    var id: String{
        categoryId
    }
}

struct CategoryResponse: Decodable {
    let categories: [Category]
}
