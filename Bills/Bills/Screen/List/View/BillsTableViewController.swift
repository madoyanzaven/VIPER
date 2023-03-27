//
//  BillsTableViewController.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import UIKit
import RxSwift

// MARK: - ViewProtocol
protocol BillsViewProtocol: AnyObject {
    func reloadTable()
    func showEmptyView()
    func showErrorView(_ error: Error)
    func handleLoading(_ isloading: Bool)
}

final class BillsTableViewController: UITableViewController {
    // MARK: - Properties
    private let infoView: InfoView = InfoView.fromNib()
    private let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    private let presenter: BillsPresenterProtocol
    private var reuseIdentifier: String {
        "BillTableViewCell"
    }
    private var noDataText: String {
        return "No bills to show"
    }
    private var navigationTitle: String {
        return "Bills"
    }
    private var heightForRowAt: CGFloat {
        return 60
    }
    private var dataSource: UITableViewDiffableDataSource<BillSection, BillModel>?
    
    // MARK: - Init
    init(presenter: BillsPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        registerTableView()
        setupDataSource()
        bind()
        presenter.onViewDidLoad()
    }
    
    // MARK: - Setup
    private func setupView() {
        infoView.isHidden = true
        view.addSubview(infoView)
        infoView.frame = view.bounds
        tableView.tableHeaderView = activityIndicator
        title = navigationTitle
    }
    
    private func setupDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { [weak self ]tableView, indexPath, model -> UITableViewCell? in
            guard let self = self,
                  let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as? BillTableViewCell,
                  let billModel = self.presenter.models[safe: indexPath.row]
            else {
                return UITableViewCell()
            }
            cell.setup(with: billModel)
            
            return cell
        })
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<BillSection, BillModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(presenter.models)
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
    
    private func setupIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
    private func registerTableView() {
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - Bind
    private func bind() {
        infoView.buttonActionPublishRelay.observe(on: MainScheduler.instance).subscribe { [weak self] _ in
            self?.presenter.onViewDidLoad()
        }.disposed(by: presenter.disposeBag)
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showAlert()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRowAt
    }
    
    // MARK: - UIScrollViewDelegate
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            presenter.onViewDidLoad()
        }
    }
}

// MARK: - BillsViewProtocol
extension BillsTableViewController: BillsViewProtocol {
    func reloadTable() {
        infoView.isHidden = true
        updateSnapshot()
    }
    
    func showEmptyView() {
        infoView.setup(with: MessageModel(title: noDataText))
        infoView.isHidden = false
    }
    
    func showErrorView(_ error: Error) {
        if let error = error as? ParsingError {
            infoView.setup(with: MessageModel(title: error.text))
        } else {
            infoView.setup(with: MessageModel(title: error.localizedDescription))
        }
        infoView.isHidden = false
    }
    
    func handleLoading(_ isloading: Bool) {
        isloading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
}
