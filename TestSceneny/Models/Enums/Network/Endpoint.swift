//
//  Endpoint.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation

struct Endpoint: URLRequestConvertible {
    let baseURL: URL
    let path: String
    let method: HTTPMethod
    let queryParams: [URLQueryItem]?
    let headers: [String: String]?
    let body: Data?
    
    init(baseURL: URL, path: String, method: HTTPMethod, queryParams: [URLQueryItem]? = nil, body: Data? = nil, headers: [String: String]? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.queryParams = queryParams
        self.headers = headers
        self.body = body
    }

    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        urlComponents.path = path
        urlComponents.queryItems = queryParams

        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body

        return request
    }
}
