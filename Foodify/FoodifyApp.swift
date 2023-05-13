//
//  FoodifyApp.swift
//  Foodify
//
//  Created by Aziz Kızgın on 29.04.2023.
//

import SwiftUI

@main
struct FoodifyApp: App {
    @State var showSplash: Bool = true
    var body: some Scene {
        WindowGroup {
            if(showSplash){
                SplashView()
                    .onAppear(
                        perform: showApp
                    )
            }
            else {
                Home()
            }
        }
    }
    
    private func showApp(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            showSplash = false
        }
    }
}
