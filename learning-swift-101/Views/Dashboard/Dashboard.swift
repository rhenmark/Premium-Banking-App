//
//  Dashboard.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 12/2/23.
//

import SwiftUI

struct CreditListHeader: View {
    var body: some View {
        Text("Credit Cards")
    }
}

struct CreditList: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: CardListingHeader(sectionTitle: "Credit Cards", hideButton: true)) {
                    HStack {
                        Label("", systemImage: "pencil")
                            .labelStyle(IconOnlyLabelStyle())
                            .font(.system(size: 24))
                            .frame(width: 24)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Calculate and take a credit")
                                .lineLimit(1)
                            Text("Create a regular payment and transfer")
                                .font(.caption)
                                .lineLimit(1)
                        }
                        .padding()
                        Spacer()
                        Label("", systemImage: "chevron.right")
                            .labelStyle(IconOnlyLabelStyle())
                    }
                    HStack {
                        Label("", systemImage: "map")
                            .labelStyle(IconOnlyLabelStyle())
                            .font(.system(size: 24))
                            .frame(maxWidth: 24)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("ATMs and bank offices")
                                .lineLimit(1)
                            Text("Show offices and ATMS on map")
                                .font(.caption)
                                .lineLimit(1)
                        }
                        .padding()
                        
                        Spacer()
                        Label("", systemImage: "chevron.right")
                            .labelStyle(IconOnlyLabelStyle())
                    }
                }
                .frame(height: 50)
            }
            .background(Color.white)
            .scrollContentBackground(.hidden)
            .listRowInsets(EdgeInsets())
            .listStyle(InsetGroupedListStyle())
            .scrollDisabled(true)
        }
    }
}

struct DashboardMain: View {
    let coreFeatures: [(menu: String, icon: String)] = [(menu: "Send", icon: "arrow.up.forward.circle"), (menu: "Request", icon: "arrow.down.left.circle"), (menu: "Scan", icon: "qrcode"), (menu: "Currency", icon: "dollarsign.circle")]

    @State private var showDrawer = true
    let mainCards = CardGroup(sectionTitle: "Cards", cards: [CardItems(cardName: "MasterCard PremiumB", cardNo: "1234 5678", cardValue: 12000.30), CardItems(cardName: "Visa PremiumB", cardNo: "1234 5678", cardValue: 100.30)])
    let savingsAccounts = CardGroup(sectionTitle: "Savings and Deposit", cards: [CardItems(cardName: "Test deposit account", cardNo: "1234 5678", cardValue: 12000.30)])

    var body: some View {
        VStack(alignment: .leading) {
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
            VStack(alignment: .leading, spacing: 0.0) {
                ScrollView {
                    CardListing(data: mainCards)
                    CardListing(data: savingsAccounts)
                    CreditList()
                }
                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(12)
            .offset(y: 20)
            .edgesIgnoringSafeArea(.all)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("primary"))
        .foregroundColor(Color.white)
    }
}

struct Dashboard: View {
    
    @State var activeTab = "Home"
    
    var body: some View {
        TabView(selection: $activeTab) {
            Group {
                DashboardWrapper(isDashboard: true) {
                    DashboardMain()
                }.tabItem {
                        Label("", systemImage: "house")
                            .labelStyle(.iconOnly)
                            .offset(y: -20)
                            .edgesIgnoringSafeArea(.bottom)

                    }
                    .tag("Home")
                    .toolbarBackground(.visible, for: .navigationBar, .tabBar)
                    
                DashboardWrapper(pageTitle: "Transfer and Payments") {
                    TransferPayments()
                }.tabItem {
                        Label("", systemImage: "creditcard.fill")
                            .labelStyle(.iconOnly)
                    }
                    .tag("TransferAndPayments")
                    .toolbarBackground(.visible, for: .navigationBar, .tabBar)

                DashboardWrapper(pageTitle: "Finances") {Finances()}
                    .tabItem {
                        Label("", systemImage: "chart.pie.fill")
                            .labelStyle(.iconOnly)
                    }
                    .tag("Finances")
                    .toolbarBackground(.visible, for: .navigationBar, .tabBar)
                DashboardWrapper(pageTitle: "Settings"){Settings()}
                    .tabItem {
                        Label("", systemImage: "gearshape")
                            .labelStyle(.iconOnly)
                    }
                    .tag("Settings")
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
