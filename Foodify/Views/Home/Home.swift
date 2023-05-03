//
//  ContentView.swift
//  Foodify
//
//  Created by Aziz Kızgın on 29.04.2023.
//

import SwiftUI

struct Home: View {
    @ObservedObject var appViewModal = AppViewModal()
    @State var searchText = ""
    var body: some View {
        NavigationView{
            GeometryReader{
                proxy in
                let safeAreaTop = proxy.safeAreaInsets.top
                VStack(spacing:0){
                    VStack{
                        Header(safeAreaTop: safeAreaTop)
                    }
                    ScrollView{
                        SearchBox(searchText: $searchText)
                        CategoryList(categoryList: categoryItemList)
                    }
                }.edgesIgnoringSafeArea(.top)
            }
        }
    }
}




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
 
