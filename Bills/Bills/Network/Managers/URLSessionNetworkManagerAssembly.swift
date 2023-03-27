//
//  URLSessionNetworkManagerAssembly.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation
import Swinject

struct URLSessionNetworkManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Fetching.self) { _ in URLSessionNetworkManager() }
    }
}
