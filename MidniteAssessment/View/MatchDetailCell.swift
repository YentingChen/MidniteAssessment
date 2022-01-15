//
//  MatchDetailCell.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/15.
//

import UIKit

class MatchDetailCell: UITableViewCell {
    
    static var cellHeight: CGFloat = 60
    var padding: CGFloat = 16
    
    var labelText: String? {
        
        didSet {
            bindViewModel()
        }
    }
    
    
    lazy var matchDetailLabel: UILabel = {
        
        let label = UILabel()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(matchDetailLabel)
        
        
        matchDetailLabel.snp.makeConstraints { make in
            make.top.leading.bottom.right.equalToSuperview().inset(padding)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        matchDetailLabel.text = nil
    
    }
    
    private func bindViewModel() {
        
        matchDetailLabel.text = labelText
    
    }
}
