//
//  LinkButton.swift
//  Foodify
//
//  Created by Aziz Kızgın on 6.05.2023.
//

import SwiftUI

struct LinkButton: View {
    let link: String?
    var body: some View {
        if let link = link {
            Button(action: {
                if let url = URL(string: link) {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("Open YouTube")
                    .padding(15)
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .bold()
            }
            .background(Color(.red))
            .cornerRadius(20)
            .padding()
        }
    }
}
