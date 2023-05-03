//
//  CategoryList.swift
//  Foodify
//
//  Created by Aziz Kızgın on 30.04.2023.
//

import Foundation
import SwiftUI

struct CategoryListItem{
    var id: Int
    var name: String
    var mealCount: Int
    var color: Color
}

let categoryItemList = [
    CategoryListItem(id: 13, name: "Breakfast", mealCount: 7, color: Color(hex:"F7DC6F")),
    CategoryListItem(id: 1, name: "Beef", mealCount: 42, color: Color(hex:"db0021")),
    CategoryListItem(id: 6, name: "Pasta", mealCount: 9, color: Color(hex:"FFA07A")),
    CategoryListItem(id: 12, name: "Vegetarian", mealCount: 32, color: Color(hex:"2ECC71")),
    CategoryListItem(id: 8, name: "Seafood", mealCount: 28, color: Color(hex:"1E90FF")),
    CategoryListItem(id: 2, name: "Chicken", mealCount: 35, color: Color(hex:"FFFACD")),
    CategoryListItem(id: 3, name: "Dessert", mealCount: 64, color: Color(hex:"FF69B4")),
    CategoryListItem(id: 11, name: "Vegan", mealCount: 3, color: Color(hex:"228B22")),
    CategoryListItem(id: 4, name: "Lamb", mealCount: 14, color: Color(hex:"8B4513")),
    CategoryListItem(id: 5, name: "Miscellaneous", mealCount: 11, color: Color(hex:"A9A9A9")),
    CategoryListItem(id: 7, name: "Pork", mealCount: 19, color: Color(hex:"FFC0CB")),
    CategoryListItem(id: 9, name: "Side", mealCount: 16, color: Color(hex:"F5F5DC")),
    CategoryListItem(id: 10, name: "Starter", mealCount: 4, color: Color(hex:"FFD700")),
    CategoryListItem(id: 14, name: "Goat", mealCount: 1, color: Color(hex:"F5DEB3"))
]

