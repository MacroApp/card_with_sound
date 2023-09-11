//
//  BoxCardView.swift
//  POC_CardWithSound
//
//  Created by Marcelo De Araújo on 11/09/23.
//

import SwiftUI

struct CardBoxView: View {
    
    @State private var receivedCards: [WordCard] = []

    var body: some View {
        VStack {
            Text("Card Box")
                .font(.headline)

            Spacer()
        }
        .frame(width: 350, height: 170)
        .background(Color.gray)
        .cornerRadius(10)
        .padding()
    }

    func addCard(_ card: WordCard) {
        receivedCards.append(card)
    }
}
