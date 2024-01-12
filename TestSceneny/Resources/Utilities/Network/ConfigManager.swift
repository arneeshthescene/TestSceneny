//
//  ConfigManager.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation
import SwiftUI

struct ConfigManager {
    
    let apiKey: String = "live_1qNr4MOZwECIytKJshXBV4Ea6FjBvRfjTZefhndtpA6dumY8MeCxjAWLK40jlgWh"
    
    let baseAPIURL: URL

    init(baseAPIURL: URL) {
        self.baseAPIURL = baseAPIURL
    }
    
    func endpoint<T: Encodable>(for path: String, method: HTTPMethod, queryParams: [String: String]? = nil, bodyParams: T, headers additionalHeaders: [String: String]? = nil) -> URLRequestConvertible {
        let queryItems = queryParams?.map { URLQueryItem(name: $0.key, value: $0.value) }
        let bodyData = try? JSONEncoder().encode(bodyParams)
        
        var allHeaders = [
            "Content-Type": "application/json",
            "x-api-key": apiKey
        ]
        
        if let additionalHeaders = additionalHeaders {
            allHeaders.merge(additionalHeaders) { (_, new) in new }
        }
        
        return Endpoint(baseURL: baseAPIURL, path: path, method: method, queryParams: queryItems, body: bodyData, headers: allHeaders)
    }
    
    func endpoint(for path: String, method: HTTPMethod, queryParams: [String: String]? = nil, headers additionalHeaders: [String: String]? = nil) -> URLRequestConvertible {
        let queryItems = queryParams?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        var allHeaders = [
            "Content-Type": "application/json",
            "x-api-key": apiKey
        ]
        
        if let additionalHeaders = additionalHeaders {
            allHeaders.merge(additionalHeaders) { (_, new) in new }
        }
        
        return Endpoint(baseURL: baseAPIURL, path: path, method: method, queryParams: queryItems, body: nil, headers: allHeaders)
    }
}
