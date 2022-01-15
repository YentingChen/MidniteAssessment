//
//  AppCoordinator.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        
        showMatchesScene()

    }
    
    func showMatchesScene() {
        
        let vc = MatchesViewController()
        
        vc.title = "Upcoming Matches"
        
        let viewModel = MatchesViewModel()
        
        viewModel.presentingDelegate = self
        
        vc.viewModel = viewModel
        
        navigationController.pushViewController( vc, animated: false)
        
    }
    
    func showMatchDetailScene(matchID: String, titleName: String?) {
        
        let vc = MatchDetailsViewController()
        
        vc.title = titleName
        
        let viewModel = MatchDetailsViewModel(matchId: matchID)
        
        vc.viewModel = viewModel
        
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension AppCoordinator: MatchesViewModelPresentingDelegate {
    
    func matchesViewModel(presentMatchId: String, name: String?) {
        
        showMatchDetailScene(matchID: presentMatchId, titleName: name)
        
    }
    
}
