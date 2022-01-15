//
//  MatchesViewController.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

import UIKit
import Kingfisher

class MatchesViewController: UIViewController {
    
    let matchesView = MatchesView()
    
    var viewModel: MatchesViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        matchViewConfiguration()
        bindViewModel()
        viewModel?.getMatches()
    }
    
    func bindViewModel() {
        
        viewModel?.matchesCellViewModels.bind({ [weak self] _ in
            
            DispatchQueue.main.async {
                
                self?.matchesView.tableView.reloadData()
                
            }
            
        })
        
        viewModel?.loadingHud.bind({ [weak self] loading in
            
            DispatchQueue.main.async {
                
                self?.matchesView.loadingIndicator.isHidden = !loading
                
            }
            
        })
    }
    
    private func matchViewConfiguration() {
        
        self.view.backgroundColor = .white
        
        matchesView.tableView.delegate = self
        matchesView.tableView.dataSource = self
        matchesView.tableView.register(MatchCell.self, forCellReuseIdentifier: String(describing: MatchCell.self))
        
        self.view.addSubview(matchesView)
        matchesView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
    }

}

extension MatchesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.matchesCellViewModels.value.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MatchCell.self), for: indexPath) as? MatchCell else { return UITableViewCell() }
        
        cell.viewModel = viewModel?.matchesCellViewModels.value[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return MatchCell.cellHeight
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel?.didSelectMatch(index: indexPath.row)
    }

}

