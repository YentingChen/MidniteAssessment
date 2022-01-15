//
//  GetMatchesRequest.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

import Foundation

struct GetMatchesRequest: BaseRequestProtocol {
    
    var path: String {
        
        return  "/v0/matches/upcoming"
    }
    
    var queryItems: [URLQueryItem]? = nil
    
    var method: HTTPMethod = .get
    
    
}

struct GetMatchDetailRequest: BaseRequestProtocol {
    
    var path: String {
        return "/v0/matches/\(matchId)"
    }
    
    var matchId: String
    
    var queryItems: [URLQueryItem]? = nil
    
    var method: HTTPMethod = .get

}
