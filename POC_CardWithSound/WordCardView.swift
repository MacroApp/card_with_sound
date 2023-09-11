//
//  WordCardView.swift
//  POC_CardWithSound
//
//  Created by Marcelo De Araújo on 05/09/23.
//

import SwiftUI
import AVFoundation

struct WordCardView: View {
    
    var wordCard: WordCard
    @Environment(\.colorScheme) var colorScheme

    @State private var cardPosition: CGSize = .zero
    @State private var gestureOffset: CGSize = .zero
    @State private var targetPosition: CGSize = .zero

    private let synthesizer = AVSpeechSynthesizer()

    var body: some View {

        ZStack {
            VStack {
                Image(wordCard.pictogramName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)

                Text(wordCard.name)
                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                    .font(.headline)
                    .padding(.top, 10)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 11)
                .fill(colorScheme == .light ? Color.black : Color.white)
            )
        }

        .offset(cardPosition)
        .gesture(
            DragGesture()
                .onChanged { value in
                    cardPosition.width = value.translation.width + gestureOffset.width
                    cardPosition.height = value.translation.height + gestureOffset.height
                }
                .onEnded { _ in
                    gestureOffset = cardPosition
                }
        )
        
        .onTapGesture {
            speakWord()
            moveToTargetPosition()
        }
        
    }

    private func speakWord() {
        let utterance = AVSpeechUtterance(string: wordCard.name)
        utterance.rate = 0.5 
        synthesizer.speak(utterance)
    }

    private func moveToTargetPosition() {
        withAnimation {
            cardPosition = targetPosition
        }
    }

    func setTargetPosition(_ position: CGSize) {
        targetPosition = position
    }
}
