//
//  ContentView.swift
//  POC_CardWithSound
//
//  Created by Marcelo De Araújo on 05/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedCard: WordCard?
    @State private var selectedCards: [WordCard] = []


    var body: some View {
        CardBoxView(selectedCards: $selectedCards)
        Spacer()
        WordCardView(
            wordCard: WordCard(
                name: "Correr",
                pictogramName: colorScheme == .dark ? "correrPreto" : "correrBranco",
                categoryld: UUID(),
                subCategoryld: UUID()
            )
        )

        Spacer()

        WordCardView(
            wordCard: WordCard(
                name: "Comer",
                pictogramName: colorScheme == .dark ? "comerPreto" : "comerBranco",
                categoryld: UUID(),
                subCategoryld: UUID()
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
