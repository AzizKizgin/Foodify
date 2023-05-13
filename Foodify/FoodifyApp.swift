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
            VStack{
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
            .animation(.easeIn(duration: 0.7),value: showSplash)
        }
    }
    
    private func showApp(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            showSplash = false
        }
    }
}
