//
//  BillsPresenter.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import RxSwift
import Foundation

// MARK: - PresenterProtocol
protocol BillsPresenterProtocol {
    var models: [BillModel] { get }
    var disposeBag: DisposeBag { get }

    func onViewDidLoad()
    func showAlert()
}

// MARK: - Presenter
final class BillsPresenter: BillsPresenterProtocol {
    weak var delegate: BillsViewProtocol?
    var disposeBag: DisposeBag = DisposeBag()
    private weak var coordinator: MainCoordinator?
    private let interactor: BillsInteractorProtocol

    private(set) var models: [BillModel] = []

    init(interactor: BillsInteractorProtocol, coordinator: MainCoordinator) {
        self.interactor = interactor
        self.coordinator = coordinator
    }

    func setViewInputDelegate(with delegate: BillsViewProtocol) {
        self.delegate = delegate
    }

    // MARK: - PresenterProtocol
    func onViewDidLoad() {
        delegate?.handleLoading(true)
        let parameter = BillParameter()
        interactor.loadBills(routing: parameter).observe(on: MainScheduler.instance).subscribe {[weak self] bills in
            guard let self = self else { return }

            self.delegate?.handleLoading(false)
            if bills.isEmpty {
                self.delegate?.showEmptyView()
            } else {
                self.models = bills.map(self.convert(from:))
                self.delegate?.reloadTable()
            }
        } onError: { [weak self] error in
            self?.delegate?.showErrorView(error)
            self?.delegate?.handleLoading(false)
        }.disposed(by: disposeBag)

    }

    func showAlert() {
        coordinator?.showAlert(message: "Go To Detail Screen?")
    }
}

// MARK: - BillsPresenterBussinessRules
extension BillsPresenter: BillsPresenterBusinessRules {}
