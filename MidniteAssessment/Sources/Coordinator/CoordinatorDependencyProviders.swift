//
//  CoordinatorDependencyProviders.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import UIKit

/// The `ApplicationFlowCoordinatorDependencyProvider` protocol defines methods to satisfy external dependencies of the ApplicationFlowCoordinator
protocol ApplicationFlowCoordinatorDependencyProvider: MatchesFlowCoordinatorDependencyProvider {}

protocol MatchesFlowCoordinatorDependencyProvider: AnyObject {
    /// Creates UIViewController to search for a movie
    func matchesNavigationController(navigator: MatchesNavigator) -> UINavigationController

    // Creates UIViewController to show the details of the movie with specified identifier
    func matchDetailsController(_ matchId: Int) -> UIViewController
}
