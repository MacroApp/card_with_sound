//
//  ContentView.swift
//  POC_CardWithSound
//
//  Created by Marcelo De Araújo on 05/09/23.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme
    var body: some View {

        WordCardView(
            wordCard: WordCard(
                name: "Correr",
                pictogramName: colorScheme == .dark ? "correrPreto" : "correrBranco",
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
