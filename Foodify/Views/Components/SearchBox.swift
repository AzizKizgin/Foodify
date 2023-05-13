//
//  SearchBox.swift
//  Foodify
//
//  Created by Aziz Kızgın on 2.05.2023.
//

import SwiftUI
import Combine

struct SearchBox: View {
    @Binding var searchText:String
    var onSearch: (String) -> Void
    let searchTextPublisher = PassthroughSubject<String, Never>()
    var body: some View {
        VStack{
            HStack(spacing:8){
                Button {
                    if !searchText.isEmpty {
                        searchText = ""
                    }
                } label: {
                    Image(systemName: searchText == "" ? "magnifyingglass": "multiply")
                        .foregroundColor(.pink)
                }

                TextField("Search", text: $searchText)
                    .tint(.white)
                    .foregroundColor(.red)
                    .onChange(of: searchText) { searchText in
                        searchTextPublisher.send(searchText)
                        onSearch(searchText)
                    }
                    .onReceive(
                        searchTextPublisher
                            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
                    ) { debouncedSearchText in
                        onSearch(debouncedSearchText)
                    }
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

