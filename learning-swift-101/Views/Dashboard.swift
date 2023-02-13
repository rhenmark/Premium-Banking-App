//
//  Dashboard.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 12/2/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        Text("Home")
    }
}

struct Transaction: View {
    var body: some View {
        Text("Transaction")
    }
}

struct Account: View {
    var body: some View {
        Text("Account")
    }
}

struct Dashboard: View {
    var body: some View {
        TabView {
            Home()
                .tabItem{
                    Label("Home", systemImage: "home")
                }
            Transaction()
                .tabItem{
                    Label("Transaction", systemImage: "home")
                }
            Account()
                .tabItem{
                    Label("Account", systemImage: "home")
                }
        }
        .navigationBarHidden(true)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
