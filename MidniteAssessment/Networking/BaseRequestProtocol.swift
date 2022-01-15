//
//  BaseRequestProtocol.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

import Foundation

protocol BaseRequestProtocol {
    
    var scheme: String { get }
    
    var host: String { get }
    
    var path: String { get }
    
    var queryItems: [URLQueryItem]? { get }
    
    var method: HTTPMethod { get }
    
}

extension BaseRequestProtocol {
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return  "api.midnite.com"
    }
    
    func asURLRequest() throws -> URLRequest {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        var urlRequest = URLRequest(url: (components.url)!)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}

enum HTTPMethod: String {
    case get = "GET"
}
