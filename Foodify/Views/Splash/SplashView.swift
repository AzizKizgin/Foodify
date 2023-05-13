//
//  SplashView.swift
//  Foodify
//
//  Created by Aziz Kızgın on 13.05.2023.
//

import SwiftUI

struct SplashView: View {
    @State var imageWidth = 0.0
    var body: some View {
        ZStack {
            Color.pink.edgesIgnoringSafeArea(.all)
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageWidth)
                    .animation(.easeIn(duration: 1),value: imageWidth)
                    .onAppear {
                        self.imageWidth = 300.0
                    }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
