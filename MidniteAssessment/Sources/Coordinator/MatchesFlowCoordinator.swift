//
//  MatchesFlowCoordinator.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import UIKit

/// The `MatchesFlowCoordinator` takes control over the flows on the matches  screen
class MatchesFlowCoordinator: FlowCoordinator {
    private let window: UIWindow
    private var navigationController: UINavigationController?
    private let dependencyProvider: MatchesFlowCoordinatorDependencyProvider

    init(window: UIWindow, dependencyProvider: MatchesFlowCoordinatorDependencyProvider) {
        self.window = window
        self.dependencyProvider = dependencyProvider
    }

    func start() {
        let navigationController = dependencyProvider.matchesNavigationController(navigator: self)
        window.rootViewController = navigationController
        self.navigationController = navigationController
    }
}

extension MatchesFlowCoordinator: MathesNavigator {
    func showDetails(forMatch matchId: Int) {
        
    }
    
}
