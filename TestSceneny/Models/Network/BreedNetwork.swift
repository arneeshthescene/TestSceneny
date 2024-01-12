//
//  BreedNetwork.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation

struct BreedDetailNetwork: Decodable {
    let id: Int
    let name: String
    let referenceImageID: String
    let bredFor: String?
    let lifeSpan: String?
    let weight: Eight?
    let height: Eight?
    let temperament: String?
    let origin: String?
    let breedGroup: String?
    
    enum CodingKeys: String, CodingKey {
        case weight, height, id, name
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
        case temperament, origin
        case referenceImageID = "reference_image_id"
    }
}
