//
//  MatchDetailsViewController.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

import UIKit

class MatchDetailsView: MatchesView {
    
}

class MatchDetailsViewController: UIViewController {
    
    var viewModel: MatchDetailsViewModel?
    
    let matchDetailsView = MatchDetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        matchDetailsViewConfiguration()
        bindViewModel()
        viewModel?.getMatchDetail()
    }
    
    private func bindViewModel() {
        
        viewModel?.cellViewModels.bind({ [weak self] _ in
            
            DispatchQueue.main.async {
                
                self?.matchDetailsView.tableView.reloadData()
            }
        })
        
        viewModel?.loadingHud.bind({ [weak self] loading in
            
            DispatchQueue.main.async {
                
                self?.matchDetailsView.loadingIndicator.isHidden = !loading
                
            }
            
        })
    }
    
    private func matchDetailsViewConfiguration() {
        
        self.view.backgroundColor = .white
        
        matchDetailsView.tableView.delegate = self
        matchDetailsView.tableView.dataSource = self
        matchDetailsView.tableView.register(MatchDetailCell.self, forCellReuseIdentifier: String(describing: MatchDetailCell.self))
        
        self.view.addSubview(matchDetailsView)
        matchDetailsView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
        
    }
    
}

extension MatchDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        viewModel?.cellViewModels.value.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.cellViewModels.value[section].contractsLabelText?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.cellViewModels.value[section].titileLabelText
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MatchDetailCell.self), for: indexPath) as? MatchDetailCell else { return UITableViewCell()}
        
        cell.labelText = viewModel?.cellViewModels.value[indexPath.section].contractsLabelText?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return MatchDetailCell.cellHeight
        
    }
    
}
