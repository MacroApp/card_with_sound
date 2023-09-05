//
//  Styles.swift
//  POC_CardWithSound
//
//  Created by Marcelo De Araújo on 05/09/23.
//

import SwiftUI

struct CardButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .compositingGroup()
            .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}
