//
//  ApplicationComponentsFactory.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import UIKit

/// The ApplicationComponentsFactory takes responsibity of creating application components and establishing dependencies between them.
final class ApplicationComponentsFactory {
    private lazy var useCase: MatchesUseCase =
    MatchesUseCase(networkService: servicesProvider.network)

    private let servicesProvider: ServicesProvider

    init(servicesProvider: ServicesProvider = ServicesProvider.defaultProvider()) {
        self.servicesProvider = servicesProvider
    }
}

extension ApplicationComponentsFactory: ApplicationFlowCoordinatorDependencyProvider {
    
    func matchesNavigationController(navigator: MatchesNavigator) -> UINavigationController {
        
        let vm = MatchesViewModel(useCase: useCase, navigator: navigator)
        let vc = MatchesViewController(viewModel: vm)
        
        let matchesNavigationController = UINavigationController(rootViewController: vc)
        return matchesNavigationController
    }
    
    func matchDetailsController(_ matchId: Int) -> UIViewController {
        return UIViewController()
    }
    
    
}
