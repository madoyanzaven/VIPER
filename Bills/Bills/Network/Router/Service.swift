//
//  Service.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation
import RxSwift

class Service {
    private let dataFetcher: DataFetching

    init(dataFetcher: DataFetching) {
        self.dataFetcher = dataFetcher
    }

    func call<T: Decodable>(routing: Routing) -> Single<T> {
        return dataFetcher.fetch(routing: routing)
    }
}
