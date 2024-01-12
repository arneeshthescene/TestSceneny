//
//  BreedDetail.swift
//  TestSceneny
//
//  Created by Vladislav on 1/12/24.
//

import Foundation

struct BreedDetail {
    var name: String
    var bredFor: String?
    var lifeSpan: String?
    var referenceImageID: String
    var origin: String?
    var breedGroup: String?
}

extension BreedDetail {
    init(from networkModel: BreedDetailNetwork) {
        self.name = networkModel.name
        self.breedGroup = networkModel.breedGroup
        self.bredFor = networkModel.bredFor
        self.lifeSpan = networkModel.lifeSpan
        self.origin = networkModel.origin
        self.referenceImageID = networkModel.referenceImageID
    }
}
