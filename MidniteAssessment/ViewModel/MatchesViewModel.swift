//
//  MatchesViewModel.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

protocol MatchesViewModelPresentingDelegate: AnyObject {
    
    func matchesViewModel(presentMatchId: String, name: String?)
    
}

class MatchesViewModel {
    
    weak var presentingDelegate: MatchesViewModelPresentingDelegate?
    
    var matches: [Match] = [] {
        
        didSet {
            
            matchesCellViewModels.value = matches
        }
    }
    
    var matchesCellViewModels: Bindable<[MatchCellViewModel]> = Bindable([])
    
    var loadingHud: Bindable<Bool> = Bindable(false)
    
    let networkingManager = MatchesNetworkingManager()
    
    func getMatches() {
        
        let request = GetMatchesRequest()
        
        loadingHud.value = true
        
        networkingManager.getMathes(request: request) { [weak self] result in
            
            self?.loadingHud.value = false
            
            switch result {
                
            case .success(let response):
                
                self?.matches = response?.data ?? []
                
            case .failure(let error):
                
                print(error.localizedDescription)
                
            }
        }
        
        
    }
    
    func didSelectMatch(index: Int) {
        
        guard let matchId = matches[index].id?.description else { return }
        
        let matchName = matches[index].competitionName ?? "Match Detail"
        
        presentingDelegate?.matchesViewModel(presentMatchId: matchId, name: matchName)
        
    }
    
}
