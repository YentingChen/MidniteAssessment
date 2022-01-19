//
//  ApplicationFlowCoordinatorDependencyProviderMock.swift
//  MidniteAssessmentTests
//
//  Created by Yenting Chen on 2022/1/19.
//

import UIKit
@testable import MidniteAssessment

class ApplicationFlowCoordinatorDependencyProviderMock: ApplicationFlowCoordinatorDependencyProvider {
    
    var navigationControllerReturnValue: UINavigationController?
    func matchesNavigationController(navigator: MatchesNavigator) -> UINavigationController {
        return navigationControllerReturnValue!
    }
    
    var detailsControllerReturnValue: UIViewController?
    func matchDetailsController(_ matchId: Int) -> UIViewController {
        return detailsControllerReturnValue!
    }
    
}
