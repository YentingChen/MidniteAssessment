//
//  Resource.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import Foundation

struct Resource<T: Decodable> {
    let url: URL
    let parameters: [String: CustomStringConvertible]
    var request: URLRequest? {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.queryItems = parameters.keys.map { key in
            URLQueryItem(name: key, value: parameters[key]?.description)
        }
        guard let url = components.url else {
            return nil
        }
        return URLRequest(url: url)
    }

    init(url: URL, parameters: [String: CustomStringConvertible] = [:]) {
        self.url = url
        self.parameters = parameters
    }
}

extension Resource {
    
    static func matches() -> Resource<String> {
        let url = ApiConstants.baseUrl.appendingPathComponent("/v0/matches/upcoming")
        return Resource<String>(url: url)
        
    }
    
    static func details(matchId: Int) -> Resource<String> {
        let url = ApiConstants.baseUrl.appendingPathComponent("/v0/matches/\(matchId)")
        return Resource<String>(url: url)
        
    }
}
