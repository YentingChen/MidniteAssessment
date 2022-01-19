//
//  Match.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

// MARK: - GetMatchesResponse
struct MatchesResponse: Codable {
    let data: [Match]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

// MARK: - Match
struct Match: Codable {
    
    let competitionName: String?
    let awayImageURL: String?
    let homeImageURL: String?
    let awayTeam: String?
    let homeTeam: String?
    let id: Int?
    let name: String?
    let market: Market?
    let startTime: String?
   
    enum CodingKeys: String, CodingKey {
        
        case market
        case name
        case id
        case homeImageURL = "home_image_url"
        case awayImageURL = "away_image_url"
        case awayTeam = "away_team"
        case homeTeam = "home_team"
        case competitionName = "competition_name"
        case startTime = "start_time"
    }
}

// MARK: - Market
struct Market: Codable {
    let contracts: [Contract]?
    let displayOrder, id, matchID: Int?
    let name: String?
    let popular: Bool?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case contracts
        case displayOrder = "display_order"
        case id
        case matchID = "match_id"
        case name, popular, status
    }
}

// MARK: - Contract
struct Contract: Codable {
    
    let name, price: String?
    let shortName: String?

    enum CodingKeys: String, CodingKey {

        case name, price
        case shortName = "short_name"
       
    }
}

// MARK: - MatchDetail
struct MatchDetail: Codable {
    
    let awayTeam: String?
    let competitionName: String?
    let homeTeam: String?
    let markets: [Market]?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case awayTeam = "away_team"
        case competitionName = "competition_name"
        case homeTeam = "home_team"
        case markets
        case name
    }
}
