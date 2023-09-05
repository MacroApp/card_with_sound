//
//  WordCard.swift
//  POC_CardWithSound
//
//  Created by Marcelo De Araújo on 05/09/23.
//

import Foundation

class WordCard {

    var name: String
    let pictogramName: String
//    let pictogram: UIImage
//    let pictogramURL: URL?
    let categoryld: UUID
    let subCategoryld: UUID
    let usageCount: Int64 = 0

    init(
        name: String,
        pictogramName: String,
        categoryld: UUID,
        subCategoryld: UUID
    ){
        self.name = name
        self.pictogramName = pictogramName
        self.categoryld = categoryld
        self.subCategoryld = subCategoryld
    }

    func incrementUsageCount() -> Bool {
        return true
    }

}
