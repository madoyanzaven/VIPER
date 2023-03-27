//
//  DataFetcherManagerAssembly.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation
import Swinject

struct DataFetcherManagerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DataFetching.self) { r in DataFetcherManager(dataFetcher: r.resolve(Fetching.self)!, parser: r.resolve(Parsing.self)!)
        }
    }
}
