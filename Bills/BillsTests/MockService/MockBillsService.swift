//
//  MockBillsService.swift
//  BillsTests
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation
import RxSwift

@testable import Bills

class MockBillsService: BaseMockService, BillsServicing {
    func loadBills(routing: BillParameter) -> Observable<[BillResponse]> {
        fetchMethodCallCount += 1

        return Single.create { single in
            guard !self.shouldThrowError else {
                single(.failure(MockError.failure))

                return Disposables.create()
            }

            let response = BillListResponseFactory.createBillResponse()

            single(.success(response))

            return Disposables.create()
        }.asObservable()
    }
}
