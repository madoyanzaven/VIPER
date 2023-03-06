//
//  MainCoordinatorFactory.swift
//  Bills
//
//  Created by Zaven Madoyan on 25.01.23.
//

import UIKit

enum MainCoordinatorFactory {
    static func make() -> MainCoordinator {
        let navController = UINavigationController()
        
        return MainCoordinator(navigationController: navController)
    }
}
