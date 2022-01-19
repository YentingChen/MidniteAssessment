//
//  Resource+Match.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

extension Resource {

    static func matches() -> Resource<MatchesResponse> {
        let url = ApiConstants.baseUrl.appendingPathComponent("/v0/matches/upcoming")
        return Resource<MatchesResponse>(url: url)
    }

    static func details(matchId: Int) -> Resource<Match> {
        let url = ApiConstants.baseUrl.appendingPathComponent("/v0/matches/\(matchId)")
        return Resource<Match>(url: url)
    }
}

