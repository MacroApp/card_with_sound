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
    private let synthesizer = AVSpeechSynthesizer()

    var body: some View {

        ZStack {
//            RoundedRectangle(cornerRadius: 10)
////                .fill(Color(UIColor.red))
//                .fill(colorScheme == .light ? Color.black : Color.white)
//                .frame(width: 100, height: 150) // Ajuste o tamanho do card conforme necessário
//                .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
//            //                .offset(offset)

            VStack {
                Image(wordCard.pictogramName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80) // Ajuste o tamanho da imagem conforme necessário

                Text(wordCard.name)
//                    .fixedSize(horizontal: false, vertical: true) // Permita expansão vertical
                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
//                    .foregroundColor(Color(UIColor.label))
                    .font(.headline)
                    .padding(.top, 10) // Ajuste o espaçamento conforme necessário
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 11)
                .fill(colorScheme == .light ? Color.black : Color.white)
            )
        }

        .offset(cardPosition)
        .gesture(
            DragGesture() // Adicionando um gesto de arrastar
                .onChanged { value in

                    // Atualizando o estado com a posição de arrasto
                    cardPosition.width = value.translation.width + gestureOffset.width
                    cardPosition.height = value.translation.height + gestureOffset.height
                }
                .onEnded { _ in
                    gestureOffset = cardPosition // Resetando o deslocamento quando o arrasto é encerrado
                }
        )

        .onTapGesture {
            speakWord()
        }
        //        Button(action: {
        //            speakWord()
        //        }) {
        //            VStack {
        //                Image(wordCard.pictogramName)
        //                    .resizable()
        //                    .aspectRatio(contentMode: .fit)
        //                    .frame(width: 100, height: 100)
        //
        //                Text(wordCard.name)
        //                    .font(.headline)
        //                    .foregroundColor(.red)
        //
        //            }
        //        }
        //        .buttonStyle(CardButtonStyle())
    }

    //    var body: some View {
    //        VStack {
    //            Image(wordCard.pictogramName)
    //                .resizable()
    //                .aspectRatio(contentMode: .fit)
    //                .frame(width: 100, height: 100)
    //                .onTapGesture {
    //                    speakWord()
    //                }
    //
    //            Text(wordCard.name)
    //                .font(.headline)
    //
    //            Text("Usage Count: \(wordCard.usageCount)")
    //                .font(.subheadline)
    //        }
    //    }

    private func speakWord() {
        let utterance = AVSpeechUtterance(string: wordCard.name)
        utterance.rate = 0.5 // Ajuste a velocidade da fala conforme necessário
        synthesizer.speak(utterance)
    }
}
