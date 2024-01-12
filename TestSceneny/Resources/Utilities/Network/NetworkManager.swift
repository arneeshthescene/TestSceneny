//
//  NetworkManager.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation

class NetworkManager {
    
    func performRequest<T: Decodable>(endpoint: URLRequestConvertible) async throws -> T {
        let request = try endpoint.asURLRequest()
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
}
