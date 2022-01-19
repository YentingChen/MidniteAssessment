//
//  MatchCell.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import UIKit

class MatchCell: UITableViewCell {
    
    static let cellHeight: CGFloat = 150
    
    private var padding: CGFloat = 16
    
    private var imageHeight: CGFloat = 30
    
    private var titileHeight: CGFloat = 30
    
    private var priceLableWidth: CGFloat = 80
    
    var viewModel: MatchCellViewModel? {
        
        didSet {
            
            bindViewModel()
            
        }
    }
    
    lazy var homeImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var awayImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var matchTitleLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .left
        
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var timeTitleLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .left
        
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var homeTitleLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .left
        
        label.numberOfLines = 1
        
        return label
    }()
    
    lazy var awayTitleLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .left
        
        label.numberOfLines = 1
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        subviewsConfiguration()
        
    }
    
    private func subviewsConfiguration() {
        
        self.contentView.addSubview(matchTitleLabel)
        self.contentView.addSubview(timeTitleLabel)
        self.contentView.addSubview(homeImageView)
        self.contentView.addSubview(awayImageView)
        self.contentView.addSubview(homeTitleLabel)
        self.contentView.addSubview(awayTitleLabel)
       
        matchTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(padding)
            make.leading.equalToSuperview().inset(padding)
            make.trailing.equalToSuperview().inset(padding)
            make.height.equalTo(titileHeight)
        }
        
        timeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(matchTitleLabel.snp.bottom).offset(padding)
            make.leading.equalToSuperview().inset(padding)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().inset(padding)
        }
        
        homeImageView.snp.makeConstraints { make in
            make.height.equalTo(imageHeight)
            make.width.equalTo(imageHeight)
            make.leading.equalTo(timeTitleLabel.snp.trailing).offset(padding)
            make.top.equalTo(matchTitleLabel.snp.bottom).offset(padding)
        }
        
        awayImageView.snp.makeConstraints { make in
            make.height.equalTo(imageHeight)
            make.width.equalTo(imageHeight)
            make.leading.equalTo(timeTitleLabel.snp.trailing).offset(padding)
            make.bottom.equalToSuperview().inset(padding)
        }
        
        awayTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(awayImageView)
            make.trailing.equalToSuperview().inset(padding)
            make.height.equalTo(imageHeight)
            make.leading.equalTo(awayImageView.snp.trailing).offset(padding)
        }
        
        homeTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(homeImageView)
            make.trailing.equalToSuperview().inset(padding)
            make.height.equalTo(imageHeight)
            make.leading.equalTo(homeImageView.snp.trailing).offset(padding)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        homeImageView.image = nil
        awayImageView.image = nil
        matchTitleLabel.text = nil
        timeTitleLabel.text = nil
        homeTitleLabel.text = nil
        awayTitleLabel.text = nil
    }
    
    func bindViewModel() {
        
        matchTitleLabel.text = viewModel?.competitionLabelText
        timeTitleLabel.text = viewModel?.timeLabelText
        awayTitleLabel.text = viewModel?.awayLabelText
        homeTitleLabel.text = viewModel?.homeLabelText
    }
    
}
