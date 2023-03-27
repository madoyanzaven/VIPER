//
//  BillServiceAssemby.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation
import Swinject

final class BillServiceAssemby: Assembly {
    func assemble(container: Container) {
        container.register(BillsServicing.self) { _ in BillService(dataFetcher: DataFetcherManagerProvider.web)}
    }
}
