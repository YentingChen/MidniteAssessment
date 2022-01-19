//
//  MatchesUseCaseType.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import Combine
import Foundation

protocol MatchesUseCaseType {
    
    func getMatchList() -> AnyPublisher<Result<MatchesResponse, Error>, Never>
    
    func matchDetail(with id: Int) -> AnyPublisher<Result<Match, Error>, Never>
}

final class MatchesUseCase: MatchesUseCaseType {
    
    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    func getMatchList() -> AnyPublisher<Result<MatchesResponse, Error>, Never> {
        
        return networkService.load(Resource<MatchesResponse>.matches())
            .map({ .success( $0 )})
            .catch { error -> AnyPublisher<Result<MatchesResponse, Error>, Never> in .just(.failure(error)) }
            .subscribe(on: Scheduler.backgroundWorkScheduler)
            .receive(on: Scheduler.mainScheduler)
            .eraseToAnyPublisher()
    }
    
    func matchDetail(with id: Int) -> AnyPublisher<Result<Match, Error>, Never> {
        
        return networkService.load(Resource<Match>.details(matchId: id))
            .map({ .success( $0 )})
            .catch { error -> AnyPublisher<Result<Match, Error>, Never> in .just(.failure(error)) }
            .subscribe(on: Scheduler.backgroundWorkScheduler)
            .receive(on: Scheduler.mainScheduler)
            .eraseToAnyPublisher()

    }
    
}

final class Scheduler {

    static var backgroundWorkScheduler: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 5
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return operationQueue
    }()

    static let mainScheduler = RunLoop.main

}
