//
//  MatchesNetworkingManager.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

import Foundation

class MatchesNetworkingManager {
    
    let getMatchesAPIService = GetMatchesAPIService()
    let getMatchDetailAPIService = GetMatchDetailAPIService()
    
    lazy var getMatchesApiLoader = APIRequestLoader(apiService: getMatchesAPIService)
    lazy var getMatchDetailApiLoader = APIRequestLoader(apiService: getMatchDetailAPIService)
    
    func getMathes(request: GetMatchesRequest, completionHandler: @escaping (Result<MatchesResponse?, APIError>) -> Void) {
        
        getMatchesApiLoader.loadAPIRequest(request: request, completionHandler: completionHandler)
        
    }
    
    func getMathDetail(request: GetMatchDetailRequest, completionHandler: @escaping (Result<MatchDetail?, APIError>) -> Void) {
        
        getMatchDetailApiLoader.loadAPIRequest(request: request, completionHandler: completionHandler)
        
    }
}
