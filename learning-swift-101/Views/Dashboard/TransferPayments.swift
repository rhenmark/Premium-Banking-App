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
                        AsyncImage(url: URL(string: "https://i.pravatar.cc/60?img=\(id+21)"))
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
    var body: some View {
        VStack(alignment: .leading) {
            PaymentContacts()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
        .padding(.top, 0)
    }
}

struct TransferPayments_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(activeTab: "TransferAndPayments")
    }
}
