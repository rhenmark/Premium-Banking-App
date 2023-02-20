//
//  Dashboard.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 12/2/23.
//

import SwiftUI

struct Home: View {
    let dummyImage = "https://i.pravatar.cc/40?img=6"
    let coreFeatures: [(menu: String, icon: String)] = [(menu: "Send", icon: "arrow.up.forward.circle"), (menu: "Request", icon: "arrow.down.left.circle"), (menu: "Scan", icon: "qrcode"), (menu: "Currency", icon: "dollarsign.circle")]

    @State private var showDrawer = true

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 20) {
                AsyncImage(url: URL(string: dummyImage))
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .scaledToFill()
                VStack(alignment: .leading) {
                    Text("Hi John,")
                        .font(.headline)
                    Text("Your card is ready!")
                }
                Spacer()
                Label("", systemImage: "bell.fill")
                    .labelStyle(.iconOnly)
                    .badge(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            Spacer()
                .frame(height: 32)
            HStack {
                ForEach(coreFeatures, id: \.menu) { menu, icon in
                    Spacer()
                    Button(action: {}) {
                        VStack {
                            Image(systemName: icon)
                                .font(.system(size: 28))
                                .frame(width: 60, height: 60)
                                .overlay(Circle().stroke(Color(hue: 1.0, saturation: 0.024, brightness: 0.793, opacity: 0.389), lineWidth: 1))
                            Text(menu)
                                .font(.system(size: 14))
                        }
                    }
                    Spacer()
                }
            }
            .frame(alignment: .center)
            .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
                .frame(height: 12)
            Spacer()
            VStack {
                ScrollView {
                    VStack {
                        Text("Test")
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                        Text("Test")
                            .frame(height: 400)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(8)
            .offset(y: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("primary"))
        .foregroundColor(Color.white)
    }
}

struct Cards: View {
    var body: some View {
        Text("Transaction")
    }
}

struct Finances: View {
    var body: some View {
        Text("Account")
    }
}

struct Settings: View {
    var body: some View {
        Text("Account")
    }
}

struct Dashboard: View {
    var body: some View {
        TabView {
            Group {
                Home()
                    .tabItem {
                        Label("", systemImage: "house")
                            .labelStyle(.iconOnly)
                    }
                    .toolbarBackground(.visible, for: .navigationBar, .tabBar)

                Cards()
                    .tabItem {
                        Label("", systemImage: "creditcard.fill")
                            .labelStyle(.iconOnly)
                    }
                    .toolbarBackground(.visible, for: .navigationBar, .tabBar)

                Finances()
                    .tabItem {
                        Label("", systemImage: "chart.pie.fill")
                            .labelStyle(.iconOnly)
                    }
                    .toolbarBackground(.visible, for: .navigationBar, .tabBar)
                Settings()
                    .tabItem {
                        Label("", systemImage: "gearshape")
                            .labelStyle(.iconOnly)
                    }
                    .toolbarBackground(.visible, for: .navigationBar, .tabBar)
            }
            .toolbarBackground(Color.white, for: .tabBar)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .navigationBarHidden(true)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
