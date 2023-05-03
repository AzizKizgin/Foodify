//
//  SearchBox.swift
//  Foodify
//
//  Created by Aziz Kızgın on 2.05.2023.
//

import SwiftUI

struct SearchBox: View {
    @Binding var searchText:String
    var body: some View {
        VStack{
            HStack(spacing:8){
                Image(systemName:"magnifyingglass")
                    .foregroundColor(.white)
                TextField("Search", text: $searchText)
                    .tint(.white)
                    .foregroundColor(.white)
            }
            .padding(.vertical,10)
            .padding(.horizontal,15)
            .background{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.pink)
                    .opacity(0.2)
            }
        }.padding()
    }
}

