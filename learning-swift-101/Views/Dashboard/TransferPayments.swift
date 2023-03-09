//
//  TransferPayments.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 25/2/23.
//

import SwiftUI

struct PaymentContacts: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 14) {
                Button(action: {}) {
                    Label("", systemImage: "plus.circle")
                        .labelStyle(IconOnlyLabelStyle())
                        .font(.system(size: 40))
                }

                ForEach(0 ... 12, id: \.self) { id in
                    VStack {
                        AsyncImage(url: URL(string: "https://i.pravatar.cc/60?img=\(id + 21)"))
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .scaledToFit()
                        Text("Test Name \(id)")
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                    .frame(width: 60)
                }
            }
            .padding(.bottom, 10)
        }
        .edgesIgnoringSafeArea(.all)
        .ignoresSafeArea()
        .frame(maxWidth: .infinity)
        .scrollIndicators(.hidden)
    }
}

struct TransferPayments: View {
    let othersData = [CreditItemsData(
        icon: "arrow.left.arrow.right", title: "Between my accounts"
    ), CreditItemsData(
        icon: "person", title: "To Another person", description: "By card, phone or account number"
    ), CreditItemsData(
        icon: "globe.europe.africa", title: "Abroad", description: "To foreign bank's office"
    )]
    
    let payList = [CreditItemsData(
        icon: "arrow.triangle.2.circlepath", title: "Auto payment", description: "Create regular payments and transfers"
    ), CreditItemsData(
        icon: "qrcode", title: "By QR or bar-code"
    ), CreditItemsData(
        icon: "doc.plaintext.fill", title: "By requisites"
    ), CreditItemsData(
        icon: "phone", title: "Mobile Connection"
    )]

    var body: some View {
        VStack(alignment: .leading) {
            PaymentContacts()
                .padding(.leading, 14)
                .padding(.trailing, 14)
            Spacer()
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 4)
                ScrollView {
                    CreditList(sectionTitle: "Transfer", items: othersData)
                        .padding(.bottom, -44)
                    CreditList(sectionTitle: "Pay", items: payList)
                        .frame(height: 500)
                    Spacer()
                        .frame(height: 60)
                }
                .background(Color.white)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color.white)
            .foregroundColor(Color.black)
            .cornerRadius(12)
            .offset(y: 20)
            .edgesIgnoringSafeArea(.all)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

struct TransferPayments_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(activeTab: "TransferAndPayments")
    }
}
