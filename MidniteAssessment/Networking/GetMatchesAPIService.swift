//
//  GetMatchesAPIService.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//
import Foundation

class GetMatchesAPIService: APIServiceProtocol {
    
    typealias RequestDataType = GetMatchesRequest
    
    typealias ResponseDataType = MatchesResponse
    
    func makeRequest(from request: GetMatchesRequest) throws -> URLRequest {

        return try request.asURLRequest()
    }
    
    func parseResponse(from response: Data) throws -> MatchesResponse {
        return try JSONDecoder().decode(ResponseDataType.self, from: response)
    }
    
}

class GetMatchDetailAPIService: APIServiceProtocol {
    
    typealias RequestDataType = GetMatchDetailRequest
    
    typealias ResponseDataType = MatchDetail
    
    func makeRequest(from request: GetMatchDetailRequest) throws -> URLRequest {

        return try request.asURLRequest()
    }
    
    func parseResponse(from response: Data) throws -> MatchDetail {
        return try JSONDecoder().decode(ResponseDataType.self, from: response)
    }
    
}
