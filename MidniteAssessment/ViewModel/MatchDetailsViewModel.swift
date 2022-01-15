//
//  MatchDetailsViewModel.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

import Foundation

class MatchDetailsViewModel {
    
    let matchId: String
    
    let networkingManager = MatchesNetworkingManager()
    
    let cellViewModels: Bindable<[MatchDetailsCellViewModel]> = Bindable([])
    
    var loadingHud: Bindable<Bool> = Bindable(false)
    
    init(matchId: String = "") {
        
        self.matchId = matchId
    }
    
    func getMatchDetail() {
        
        let request = GetMatchDetailRequest(matchId: matchId)
        
        loadingHud.value = true
        
        networkingManager.getMathDetail(request: request) { [weak self] result in
            
            self?.loadingHud.value = false
            
            switch result {
                
            case .success(let detail):
                
                self?.cellViewModels.value = detail?.markets ?? []
                
            case .failure(let error):
                
                print(error)
            }
        }
    }
}
