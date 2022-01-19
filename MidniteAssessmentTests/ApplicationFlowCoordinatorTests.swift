//
//  ApplicationFlowCoordinatorTests.swift
//  MidniteAssessmentTests
//
//  Created by Yenting Chen on 2022/1/19.
//

import XCTest
@testable import MidniteAssessment

class ApplicationFlowCoordinatorTests: XCTestCase {
    
    private lazy var flowCoordinator = ApplicationFlowCoordinator(window: window, dependencyProvider: dependencyProvider)
    private let window =  UIWindow()
    private let dependencyProvider = ApplicationFlowCoordinatorDependencyProviderMock()

    /// Test that application flow is started correctly
    func test_startsApplicationsFlow() {
        // GIVEN
        let rootViewController = UINavigationController()
        dependencyProvider.navigationControllerReturnValue = rootViewController

        // WHEN
        flowCoordinator.start()

        // THEN
        XCTAssertEqual(window.rootViewController, rootViewController)
    }
}
