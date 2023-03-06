//
//  MockBillsInteractor.swift
//  BillsTests
//
//  Created by Zaven Madoyan on 25.01.23.
//

import Foundation
import RxSwift
@testable import Bills

final class MockBillsInteractor: BillsInteractorProtocol {
    let service: BillsServicing

    init(service: BillsServicing) {
        self.service = service
    }

    func loadBills(routing: BillParameter) -> Observable<[BillResponse]> {
        return service.loadBills(routing: routing)
    }
}
