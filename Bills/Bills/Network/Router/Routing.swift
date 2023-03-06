//
//  Routing.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

protocol Routing {
    var api: Constants.API { get }
    var baseUrl: URL { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
    var urlRequest: URLRequest { get }
}

extension Routing {
    var baseUrl: URL {
        guard let baseUrl = URL(string: Constants.BaseUrl.bills ) else {
            preconditionFailure(NetworkError.missingURL.rawValue)
        }
        
        return baseUrl
    }
    
    var httpMethod: HTTPMethod { return .get }
    
    var acceptableStatusCodes: Set<Int> { return [200, 201] }
    
    var headers: [String: String] {
        let parameters = [
            "X-Request-Id": UUID().uuidString
        ]
        
        return parameters
    }
    
    var parameters: [String: Any] { return [:] }
    
    var urlRequest: URLRequest {
        let url = baseUrl.appendingPathComponent(api.path)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = httpMethod.rawValue
        
        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
}
