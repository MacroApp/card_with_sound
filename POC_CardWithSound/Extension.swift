//
//  Extension.swift
//  POC_CardWithSound
//
//  Created by Marcelo De Araújo on 05/09/23.
//

import Foundation
import SwiftUI

extension Image {
    
    func uiImage() -> UIImage {
        // Cria uma representação UIImage a partir da Image do SwiftUI
        if let uiImage = UIImage(named: "\(self)") {
            return uiImage
        } else {
            fatalError("A imagem não pôde ser convertida em UIImage.")
        }
    }
}

