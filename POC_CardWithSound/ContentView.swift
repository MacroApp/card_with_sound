//
//  ContentView.swift
//  POC_CardWithSound
//
//  Created by Marcelo De Araújo on 05/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        WordCardView(
            wordCard: WordCard(
                name: "Correr",
                pictogramName: "correr",
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
