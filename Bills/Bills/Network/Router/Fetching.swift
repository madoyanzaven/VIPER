//
//  Fetching.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation
import RxSwift

protocol Fetching {
    func fetchData(routing: Routing) -> Single<Data>
}
