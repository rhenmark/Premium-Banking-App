//
//  DashboardWrapper.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 25/2/23.
//

import SwiftUI

struct DashboardWrapper<Content>: View where Content: View {
    let dummyImage = "https://i.pravatar.cc/40?img=6"

    var isDashboard: Bool?
    var pageTitle: String?
    var bgColor: Color = Color("primary")
    var childrenView: () -> Content
    
    let defaultPageTitle = "Hi John"

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 20) {
                AsyncImage(url: URL(string: dummyImage))
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .scaledToFill()
                if !(isDashboard ?? false) {
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text(pageTitle ?? defaultPageTitle )
                        .font(.headline)
                        .foregroundColor(bgColor == Color.white ? Color.black : Color.white)
                    if isDashboard ?? false {
                        Text("Your card is ready!")
                            .font(.system(size: 12))
                            .foregroundColor(bgColor == Color.white ? Color.black : Color.white)
                    }
                }
                Spacer()
                Label("", systemImage: bgColor == Color.white ? "bell" : "bell.fill")
                    .labelStyle(.iconOnly)
                    .foregroundColor(bgColor == Color.white ? Color.black : Color.white)
                    .badge(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            Spacer()
                .frame(height: 32)
            // Children content
            childrenView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(bgColor)
        .foregroundColor(Color.white)
    }
}

struct DashboardWrapper_Previews: PreviewProvider {
    static var previews: some View {
        DashboardWrapper(isDashboard: true) {
            EmptyView()
        }
    }
}
