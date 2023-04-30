//
//  CategoryApiService.swift
//  Foodify
//
//  Created by Aziz Kızgın on 30.04.2023.
//

import Foundation

class CategoryApiService{


    func fetchCategories(completion: @escaping ([Category]?, Error?) -> Void) {
        guard let url = URL(string: Urls.categories) else {
                completion(nil, NSError(domain: "", code: -1, userInfo: nil))
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    completion(nil, error)
                    return
                }

                do {
                    let categoryResponse = try JSONDecoder().decode(CategoryResponse.self, from: data)
                    let categories = categoryResponse.categories
                    completion(categories, nil)
                } catch {
                    completion(nil, error)
                }
            }.resume()
    }
}
