//
//  MathesNavigator.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

protocol MatchesNavigator: AnyObject {
    /// Presents the movies details screen
    func showDetails(forMatch matchId: Int)
}