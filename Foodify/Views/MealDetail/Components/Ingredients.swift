import SwiftUI

struct Ingredients: View {
    let meal: Meal
    
    @ViewBuilder
    func ingredientText(_ measure: String?, _ ingredient: String?) -> some View {
        if let measure = measure, !measure.isEmpty, let ingredient = ingredient, !ingredient.isEmpty {
            HStack{
                Text("-").foregroundColor(.purple)
                Text("\(measure)").foregroundColor(.pink)
                Text("\(ingredient)")
            }
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    var body: some View {
        VStack {
            ingredientText(meal.measure1, meal.ingredient1)
            ingredientText(meal.measure2, meal.ingredient2)
            ingredientText(meal.measure3, meal.ingredient3)
            ingredientText(meal.measure4, meal.ingredient4)
            ingredientText(meal.measure5, meal.ingredient5)
            ingredientText(meal.measure6, meal.ingredient6)
            ingredientText(meal.measure7, meal.ingredient7)
            ingredientText(meal.measure8, meal.ingredient8)
            ingredientText(meal.measure9, meal.ingredient9)
            ingredientText(meal.measure10, meal.ingredient10)
        }
        VStack{
            ingredientText(meal.measure11, meal.ingredient11)
            ingredientText(meal.measure12, meal.ingredient12)
            ingredientText(meal.measure13, meal.ingredient13)
            ingredientText(meal.measure14, meal.ingredient14)
            ingredientText(meal.measure15, meal.ingredient15)
            ingredientText(meal.measure16, meal.ingredient16)
            ingredientText(meal.measure17, meal.ingredient17)
            ingredientText(meal.measure18, meal.ingredient18)
            ingredientText(meal.measure19, meal.ingredient19)
            ingredientText(meal.measure20, meal.ingredient20)
        }
    }
}
