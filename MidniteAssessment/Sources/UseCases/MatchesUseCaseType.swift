//
//  MatchesUseCaseType.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import Combine

protocol MatchesUseCaseType {
    
    func getMatchList() -> AnyPublisher<Result<String, Error>, Never>
    
    func matchDetail() -> AnyPublisher<Result<String, Error>, Never>
}

final class MatchesUseCase: MatchesUseCaseType {
    
    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    func getMatchList() -> AnyPublisher<Result<String, Error>, Never> {
        
        return Empty().eraseToAnyPublisher()
        
    }
    
    func matchDetail() -> AnyPublisher<Result<String, Error>, Never> {
        
        return Empty().eraseToAnyPublisher()

    }

    
}
