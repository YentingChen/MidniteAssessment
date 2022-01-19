//
//  MatchesViewModel.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import UIKit
import Combine

final class MatchesViewModel: MatchesViewModelType {

    private weak var navigator: MatchesNavigator?
    private let useCase: MatchesUseCaseType
    private var cancellables: [AnyCancellable] = []

    init(useCase: MatchesUseCaseType, navigator: MatchesNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }

    func transform(input: MatchesViewModelInput) -> MatchesViewModelOuput {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()

        input.selection
            .sink(receiveValue: { [unowned self] matchId in self.navigator?.showDetails(forMatch: matchId) })
            .store(in: &cancellables)

        let searchInput = input.search
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
        
        let matches = searchInput
            .filter({ !$0.isEmpty })
            .flatMapLatest({[unowned self] query in self.useCase.getMatchList() })
            .map({ result -> MatchesState in
                switch result {
                case .success(let matches) where
                    matches.data.isEmpty: return .noResults
                case .success(let matches): return .success(self.viewModels(from: matches))
                case .failure(let error): return .failure(error)
                }
            })
            .eraseToAnyPublisher()

        let initialState: MatchesViewModelOuput = .just(.idle)

        return matches
    }

    private func viewModels(from matches: MatchesResponse) -> [MatchCellViewModel] {
        
        return matches.data.map { match in
            
            return MatchViewModelBuilder.viewModel(from: match)
            
        }
    }

}

struct MatchViewModelBuilder {
    static func viewModel(from match: Match) -> MatchCellViewModel {
        return MatchCellViewModel(
            competitionLabelText: match.competitionName ?? "-",
            timeLabelText: match.startTime ?? "-",
            awayLabelText: match.awayTeam ?? "-",
            homeLabelText: match.homeTeam ?? "-",
            homeImage: .empty(),
            awayImage: .empty(),
            id: match.id ?? 0)
    }
}
