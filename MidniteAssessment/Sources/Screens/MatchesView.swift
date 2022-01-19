//
//  MatchesView.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import UIKit

class MatchesView: UIView {
    
    let tableView = UITableView()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        
        let indicator = UIActivityIndicatorView(style: .large)
        
        indicator.startAnimating()
        
        return indicator
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        self.addSubview(loadingIndicator)
        
        loadingIndicator.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.center.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
