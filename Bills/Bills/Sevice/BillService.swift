//
//  BillService.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import RxSwift
import Foundation

// MARK: - BillsServicing
protocol BillsServicing {
    func loadBills(routing: BillParameter) -> Single<[BillResponse]>
}

final class BillService: Service, BillsServicing {
    func loadBills(routing: BillParameter) -> Single<[BillResponse]> {
        return call(routing: routing)
    }
}
