//
//  Bindable.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

class Bindable<T> {
    
    typealias Listener = ((T) -> Void)
    
    var listener: Listener?

    var value: T {
        
        didSet {
            
            listener?(value)
            
        }
    }

    init(_ v: T) {
        
        self.value = v
        
    }

    func bind(_ listener: Listener?) {
        
        self.listener = listener
        
    }

}
