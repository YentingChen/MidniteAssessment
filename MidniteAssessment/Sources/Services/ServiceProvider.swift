//
//  ServiceProvider.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import Foundation

class ServicesProvider {
    let network: NetworkServiceType

    static func defaultProvider() -> ServicesProvider {
        let network = NetworkService()
        return ServicesProvider(network: network)
    }

    init(network: NetworkServiceType) {
        self.network = network
    }
}
