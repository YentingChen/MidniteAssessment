//
//  Coordinator.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    
}
