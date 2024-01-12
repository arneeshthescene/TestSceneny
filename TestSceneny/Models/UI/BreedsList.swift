//
//  BreedsList.swift
//  TestSceneny
//
//  Created by Vladislav on 1/12/24.
//

import Foundation

struct BreedsList {
    let id: Int
    let name: String
    var bredFor: String?
    var imageUrl: String
}

extension BreedsList {
    init(from networkModel: BreedsListNetwork) {
        self.id = networkModel.id
        self.name = networkModel.name
        self.imageUrl = networkModel.image.url
        self.bredFor = networkModel.bredFor
    }
}
