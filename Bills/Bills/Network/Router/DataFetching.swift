//
//  DataFetching.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation
import RxSwift

protocol DataFetching {
    init(dataFetcher: Fetching, parser: Parsing)
    func fetch<T: Decodable>(routing: Routing) -> Single<T>
}
