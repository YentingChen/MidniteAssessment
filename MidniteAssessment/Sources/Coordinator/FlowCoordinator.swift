//
//  FlowCoordinator.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/18.
//

import UIKit
import Combine


/// A `FlowCoordinator` takes responsibility about coordinating view controllers and driving the flow in the application.
protocol FlowCoordinator: AnyObject {

    /// Stars the flow
    func start()
}
