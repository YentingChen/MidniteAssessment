//
//  MidniteAssessmentTests.swift
//  MidniteAssessmentTests
//
//  Created by Yenting Chen on 2022/1/14.
//

import XCTest
@testable import MidniteAssessment

class MidniteAssessmentTests: XCTestCase {
    
    func testGetMatchesRequest() throws {
        
        let manager = MatchesNetworkingManager()
        
        let request = GetMatchesRequest()
        
        let urlRequest = try manager.getMatchesAPIService.makeRequest(from: request)
        
        XCTAssertEqual(urlRequest.url?.absoluteString, "https://api.midnite.com/v0/matches/upcoming")
        
    }
    
    func testMatchesParsingResponse() throws {
        
        let manager = MatchesNetworkingManager()
        
        if let mockMatchesUrl = Bundle(for: type(of: self)).url(forResource: "MockMatches", withExtension: "json") {
            
            do {
                
                let data = try Data(contentsOf: mockMatchesUrl)
                
                let response = try manager.getMatchesAPIService.parseResponse(from: data)
                
                XCTAssertEqual(response.data.first?.id, 415526)
                
            }
            
        }
        
    }
    
    func testGetMatchDetailRequest() throws {
        
        let manager = MatchesNetworkingManager()
        
        let request = GetMatchDetailRequest(matchId: "1234")
        
        let urlRequest = try manager.getMatchDetailAPIService.makeRequest(from: request)
        
        XCTAssertEqual(urlRequest.url?.absoluteString,  "https://api.midnite.com/v0/matches/1234")
        
    }
    
    func testMatchDetailParsingResponse() throws {
        
        let manager = MatchesNetworkingManager()
        
        if let mockMatchesUrl = Bundle(for: type(of: self)).url(forResource: "MockMatchDetail", withExtension: "json") {
            
            do {
                
                let data = try Data(contentsOf: mockMatchesUrl)
                
                let response = try manager.getMatchDetailAPIService.parseResponse(from: data)
                
                XCTAssertEqual(response.homeTeam, "TENSTAR")
                
            }
            
        }
        
    }

}
