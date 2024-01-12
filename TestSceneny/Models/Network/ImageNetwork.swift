//
//  ImageNetwork.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation

struct ImageNetwork: Decodable {
    let id: String
    let width, height: Int?
    let url: String
    let breeds: [BreedDetailNetwork]?
}
