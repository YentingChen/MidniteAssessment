//
//  MatchDetailsCellViewModel.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/15.
//

import Foundation

protocol MatchDetailsCellViewModel {
    
    var titileLabelText: String? { get }
    
    var contractsLabelText: [String]? { get }
    
}

extension Market: MatchDetailsCellViewModel {
    
    var titileLabelText: String? {
        
        return self.name
    }
    
    var contractsLabelText: [String]? {
        
        return self.contracts?.map({"\($0.name ?? "--"): \($0.price ?? "--")"})
    }
    
}
