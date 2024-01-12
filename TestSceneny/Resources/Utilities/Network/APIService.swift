//
//  APIService.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation
import SwiftUI

class APIService {
    
    private let networkManager: NetworkManager
    private let configManager: ConfigManager

    init(networkManager: NetworkManager, configManager: ConfigManager) {
        self.networkManager = networkManager
        self.configManager = configManager
    }
    
    func fetchBreedsList(page: Int) async throws -> [BreedsListNetwork] {
        let queryParams = ["limit": "10",
                           "page":"\(page)"]
        let endpoint = configManager.endpoint(for: "/v1/breeds", method: .get, queryParams: queryParams)
        return try await networkManager.performRequest(endpoint: endpoint)
    }
    
    func fetchBreeds(id: Int) async throws -> BreedDetailNetwork {
        let endpoint = configManager.endpoint(for: "/v1/breeds/\(id)", method: .get)
        return try await networkManager.performRequest(endpoint: endpoint)
    }
    
    func fetchBreedsImages(imageId: String ) async throws -> ImageNetwork {
        let endpoint = configManager.endpoint(for: "/v1/images/\(imageId)", method: .get)
        return try await networkManager.performRequest(endpoint: endpoint)
    }
    
}
