//
//  Header.swift
//  Foodify
//
//  Created by Aziz Kızgın on 2.05.2023.
//

import SwiftUI

struct Header: View {
    let safeAreaTop: CGFloat
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Text("Foodify")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 21))
                    .foregroundColor(.white)
            }
        }
        .padding([.horizontal,.bottom],15)
        .padding(.top,safeAreaTop+10)
        .background{
            Rectangle()
                .fill(.pink.gradient)
        }
    }
}
