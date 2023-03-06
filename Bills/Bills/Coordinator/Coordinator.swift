//
//  Coordinator.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
