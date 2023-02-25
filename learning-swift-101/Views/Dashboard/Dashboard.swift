//
//  Dashboard.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 12/2/23.
//

import SwiftUI

struct CreditItemsData: Identifiable, Hashable {
    var id = UUID()
    var icon: String
    var title: String
    var description: String? = ""
}

struct CreditListHeader: View {
    var headerTitle: String
    var body: some View {
        Text(headerTitle)
    }
}

struct CreditList: View {
    var sectionTitle: String
    var items: [CreditItemsData]

    var body: some View {
        NavigationView {
            List {
                Section(header: CardListingHeader(sectionTitle: sectionTitle, hideButton: true)) {
                    ForEach(items) { item in
                        HStack {
                            Label("", systemImage: item.icon)
                                .labelStyle(IconOnlyLabelStyle())
                                .font(.system(size: 24))
                                .frame(width: 24)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.title)
                                    .lineLimit(1)
                                if !(item.description?.isEmpty ?? true) {
                                    Text(item.description ?? "")
                                        .font(.caption)
                                        .lineLimit(1)
                                }
                            }
                            .padding()
                            Spacer()
                            Label("", systemImage: "chevron.right")
                                .labelStyle(IconOnlyLabelStyle())
                        }
                    }
                }
                .frame(minHeight: 50)
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

    let othersData = [CreditItemsData(
        icon: "pencil", title: "Calculate and take a credit", description: "Create a regular payment and transfer"
    ), CreditItemsData(
        icon: "map", title: "ATMs and bank offices", description: "Show offices and ATMS on map"
    )]

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
                    CreditList(sectionTitle: "Credit Card", items: othersData)
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

                DashboardWrapper(pageTitle: "Finances") { Finances() }
                    .tabItem {
                        Label("", systemImage: "chart.pie.fill")
                            .labelStyle(.iconOnly)
                    }
                    .tag("Finances")
                    .toolbarBackground(.visible, for: .navigationBar, .tabBar)
                DashboardWrapper(pageTitle: "Settings") { Settings() }
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
