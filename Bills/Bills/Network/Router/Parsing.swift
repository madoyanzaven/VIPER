//
//  Parsing.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation
import RxSwift

protocol Parsing {
    func parse<T: Decodable>(data: Data) -> Single<T>
}
