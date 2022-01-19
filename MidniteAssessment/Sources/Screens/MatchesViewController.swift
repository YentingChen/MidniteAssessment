//
//  MatchesViewController.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/19.
//

import UIKit
import Combine
import SnapKit
import Accelerate

class MatchesViewController: UIViewController {
    
    let matchesView = MatchesView()
    
    private var cancellables: [AnyCancellable] = []
    private let viewModel: MatchesViewModelType
    
    private let selection = PassthroughSubject<Int, Never>()
    private let appear = PassthroughSubject<Void, Never>()
    private let search = PassthroughSubject<String, Never>()
    
    private lazy var dataSource = makeDataSource()
    
    init(viewModel: MatchesViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        matchViewConfiguration()
        bind(to: viewModel)
        search.send("upcoming")
    }
    
    private func bind(to viewModel: MatchesViewModelType) {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        let input = MatchesViewModelInput(
            appear: appear.eraseToAnyPublisher(),
            search: search.eraseToAnyPublisher(),
            selection: selection.eraseToAnyPublisher())
        let output = viewModel.transform(input: input)
        
        output.sink(receiveValue: {[unowned self] state in
            self.render(state)
        }).store(in: &cancellables)
    }
    
    private func render(_ state: MatchesState) {
        switch state {
        case .idle:
            update(with: [], animate: true)
        case .loading:
            update(with: [], animate: true)
            matchesView.loadingIndicator.isHidden = false
        case .noResults:
            update(with: [], animate: true)
        case .failure:
            update(with: [], animate: true)
            matchesView.loadingIndicator.isHidden = true
        case .success(let matches):
            update(with: matches, animate: true)
            matchesView.loadingIndicator.isHidden = true
        }
        
    }
    
    private func matchViewConfiguration() {
        
        self.view.backgroundColor = .white
        
        matchesView.tableView.delegate = self
        matchesView.tableView.register(MatchCell.self, forCellReuseIdentifier: String(describing: MatchCell.self))
        
        self.view.addSubview(matchesView)
        matchesView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
    }

}

extension MatchesViewController {
    
    enum Section: CaseIterable {
        case matches
    }
    
    func makeDataSource() -> UITableViewDiffableDataSource<Section, MatchCellViewModel> {
        return UITableViewDiffableDataSource(
            tableView: matchesView.tableView,
            cellProvider: {  tableView, indexPath, viewMoedel in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MatchCell.self)) as? MatchCell else {
                    assertionFailure("Failed to dequeue \(MatchCell.self)!")
                    return UITableViewCell()
                }
                cell.accessibilityIdentifier = String(describing: MatchCell.self)
                cell.viewModel = viewMoedel
                return cell
            }
        )
    }
    
    func update(with matches: [MatchCellViewModel], animate: Bool = true) {
        DispatchQueue.main.async {
            var snapshot = NSDiffableDataSourceSnapshot<Section, MatchCellViewModel>()
            snapshot.appendSections(Section.allCases)
            snapshot.appendItems(matches, toSection: .matches)
            self.dataSource.apply(snapshot, animatingDifferences: animate)
        }
    }
}

extension MatchesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let snapshot = dataSource.snapshot()
        selection.send(snapshot.itemIdentifiers[indexPath.row].id)
        tableView.deselectRow(at: indexPath, animated: true)
    
    }

}

struct MatchCellViewModel {
    let competitionLabelText: String
    let timeLabelText: String
    let awayLabelText: String
    let homeLabelText: String
    let homeImage: AnyPublisher<UIImage?, Never>
    let awayImage: AnyPublisher<UIImage?, Never>
    let id: Int

    init(competitionLabelText: String, timeLabelText: String, awayLabelText: String, homeLabelText: String, homeImage: AnyPublisher<UIImage?, Never>, awayImage: AnyPublisher<UIImage?, Never>, id: Int) {
        self.competitionLabelText = competitionLabelText
        self.timeLabelText = timeLabelText
        self.awayLabelText = awayLabelText
        self.homeLabelText = homeLabelText
        self.homeImage = homeImage
        self.awayImage = awayImage
        self.id = id
    }
}

extension MatchCellViewModel: Hashable {
    static func == (lhs: MatchCellViewModel, rhs: MatchCellViewModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
