//
//  MatchesViewModelType.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import Combine

protocol MatchesViewModelType {
    func transform(input: MatchesViewModelInput) -> MatchesViewModelOuput
}

struct MatchesViewModelInput {
    /// called when a screen becomes visible
    let appear: AnyPublisher<Void, Never>
    // triggered when the search query is updated
    let search: AnyPublisher<String, Never>
    /// called when the user selected an item from the list
    let selection: AnyPublisher<Int, Never>
}

typealias MatchesViewModelOuput = AnyPublisher<MatchesState, Never>

enum MatchesState {
    case idle
    case loading
    case success([MatchCellViewModel])
    case noResults
    case failure(Error)
}

