//
//  MainCoordinator.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import UIKit
import Swinject

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let interactor = BillsInteractor(service: ServiceProvider.bill)
        let presenter = BillsPresenter(interactor: interactor, coordinator: self)
        let vc = BillsTableViewController(presenter: presenter)
        presenter.setViewInputDelegate(with: vc)
        navigationController.pushViewController(vc, animated: false)
    }

    func pushToDetail() {
        // TODO: navigate to Detail Screen
    }
    
    func showAlert(with title: String = "",
                   message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .default,
                                      handler: nil))
        
        navigationController.present(alert, animated: true)
    }
}
