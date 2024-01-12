//
//  BreedsListNetwork.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation


struct BreedsListNetwork: Decodable {
    let id: Int
    let name: String
    let image: ImageNetwork
    let weight: Eight?
    let height: Eight?
    let temperament: String?
    let origin: String?
    let referenceImageID: String?
    let breedGroup: String?
    let lifeSpan: String?
    let bredFor: String?

    enum CodingKeys: String, CodingKey {
        case weight, height, id, name, temperament, origin, image
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
        case referenceImageID = "reference_image_id"
    }
}
