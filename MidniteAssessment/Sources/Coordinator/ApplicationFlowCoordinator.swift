//
//  ApplicationFlowCoordinator.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import UIKit

/// The `ApplicationFlowCoordinator` takes control over the flows on the matches screen
class ApplicationFlowCoordinator: FlowCoordinator {
    
    private let dependencyProvider: MatchesFlowCoordinatorDependencyProvider
    private var window: UIWindow
    private var navigationController: UINavigationController?
    private var childCoordinators = [FlowCoordinator]()
    
    init(window: UIWindow, dependencyProvider: MatchesFlowCoordinatorDependencyProvider) {
        self.window = window
        self.dependencyProvider = dependencyProvider
    }
    
    /// Creates all necessary dependencies and starts the flow
    func start() {
        let matchesFlowCoordinator = MatchesFlowCoordinator(window: window, dependencyProvider: self.dependencyProvider)
        childCoordinators = [matchesFlowCoordinator]
        matchesFlowCoordinator.start()
    }
    
}
