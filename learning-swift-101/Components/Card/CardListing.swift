//
//  CardListing.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 21/2/23.
//

import SwiftUI

struct CardItems: Identifiable, Hashable {
    var id = UUID()
    var cardName: String
    var cardNo: String
    var cardValue: Float16
    var cardImage: String?
    var navigationPath: String?
}

struct CardGroup: Identifiable, Hashable {
    var id = UUID()
    var sectionTitle: String
    var cards: [CardItems]
}

struct CardListingHeader: View {
    var sectionTitle: String
    var hideButton: Bool?

    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding(.leading, -9.0)
                .textCase(.none)
            Spacer()
            if !(hideButton ?? false) {
                Button(action: {}) {
                    Label("Open new", systemImage: "plus")
                        .font(.system(size: 14))
                        .textCase(.none)
                }
                .padding(.trailing, -6.0)
                .foregroundColor(Color("primary"))
            }
            
        }
        .frame(height: 48, alignment: .leading)
    }
}

struct CardListing: View {
    @State var data = CardGroup(sectionTitle: "Cards", cards: [CardItems(cardName: "MasterCard PremiumB", cardNo: "1234 5678", cardValue: 12000.30), CardItems(cardName: "Visa PremiumB", cardNo: "1234 5678", cardValue: 100.30)])
    
    func maskedText(text: String) -> String {
        var textStr = text
        let index = textStr.index(textStr.startIndex, offsetBy: 4)
        textStr.replaceSubrange(...index, with: "**** ")
        
        return textStr
    }

    var body: some View {
        VStack(spacing: 0){
            NavigationView {
                List {
                    Section(header: CardListingHeader(sectionTitle: data.sectionTitle)) {
                        ForEach(data.cards, id: \.self) { a in
                            HStack(alignment: .center) {
                                Image(systemName: "creditcard.circle.fill")
                                    .frame(width: 40, height: 30, alignment: .center)
                                    .font(.system(size: 24))
                                VStack {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text(a.cardName)
                                                .font(.system(size: 16, weight: .semibold))
                                                .lineLimit(1)
                                            Text(maskedText(text: a.cardNo))
                                        }
                                        Spacer()
                                        Text(a.cardValue, format: .currency(code: "USD"))
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                }
                            }
                        }
                    }
                    .listRowBackground(Color("white-secondary"))
                }
                .background(Color.white)
                .scrollContentBackground(.hidden)
                .listRowInsets(EdgeInsets())
                .listStyle(InsetGroupedListStyle())
                .scrollDisabled(true)
            }
            .frame(height: CGFloat(data.cards.count) * CGFloat(80) + 64, alignment: .leading)
        }
        
    }
}

struct CardListing_Previews: PreviewProvider {
    static var previews: some View {
        CardListing()
    }
}
