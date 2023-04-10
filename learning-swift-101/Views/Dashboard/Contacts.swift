//
//  Settings.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 25/2/23.
//

import SwiftUI

struct Contacts: View {
    let contactOptions: [(icon: String, title: String, description: String)] = [
        (icon: "phone", title: "800-605-600", description: "Premium Bank hotline 24/7, toll free"),
        (icon: "map", title: "Bank offices search", description: "Show nearest offices on map"),
        (icon: "headphones", title: "Support chat", description: "Live chat 24/7")
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: CardListingHeader(sectionTitle: "Get Help", hideButton: true)) {
                    ForEach(contactOptions, id: \.title) { icon, title, description in
                        HStack {
                            Image(systemName: icon)
                                .font(.system(size: 28))
                                .frame(width: 60, height: 60)
                                .overlay(Circle().stroke(Color(hue: 1.0, saturation: 0.024, brightness: 0.793, opacity: 0.389), lineWidth: 1))
                            VStack(alignment: .leading) {
                                Text(title)
                                    .font(.system(size: 16))
                                Text(description)
                                    .font(.system(size: 12))
                            }
                        }
                        
                    }
                }
            }
            .background(Color.white)
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .listStyle(PlainListStyle())
            .scrollDisabled(true)
        }
        .foregroundColor(Color.black)
        .background(Color.white)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
