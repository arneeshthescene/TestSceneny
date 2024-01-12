//
//  URLRequestConvertible.swift
//  TestSceneny
//
//  Created by Vladislav on 1/10/24.
//

import Foundation

protocol URLRequestConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryParams: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    
    func asURLRequest() throws -> URLRequest
}
