//
//  BillsInteractor.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import RxSwift
import Foundation

// MARK: - InteractorProtocol
protocol BillsInteractorProtocol {
    func loadBills(routing: BillParameter) -> Single<[BillResponse]>
}

// MARK: - Interactor
final class BillsInteractor: BillsInteractorProtocol {
    let service: BillsServicing

    init(service: BillsServicing) {
        self.service = service
    }

    func loadBills(routing: BillParameter) -> Single<[BillResponse]> {
        service.loadBills(routing: routing)
    }
}
