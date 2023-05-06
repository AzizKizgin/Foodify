//
//  Urls.swift
//  Foodify
//
//  Created by Aziz Kızgın on 30.04.2023.
//

import Foundation

struct Urls {
    static let baseUrl = "https://www.themealdb.com/api/json/v1/1"
    static let search = "\(baseUrl)/search.php"
    static let detailById = "\(baseUrl)/lookup.php"
    static let random = "\(baseUrl)/random.php"
    static let categories = "\(baseUrl)/categories.php"
    static let categoryList = "\(baseUrl)/list.php?c=list"
    static let areaList = "\(baseUrl)/list.php?a=list"
    static let ingredientList = "\(baseUrl)/list.php?i=list"
    static let filter = "\(baseUrl)/filter.php"
    static let lookup = "\(baseUrl)/lookup.php"
}
