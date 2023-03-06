//
//  BillsPresenterBusinessRulesTests.swift
//  BillsTests
//
//  Created by Zaven Madoyan on 24.01.23.
//

import XCTest
@testable import Bills

final class BillsPresenterBusinessRulesTests: XCTestCase {
    private struct MockedBillsPresenterBusinessRules: BillsPresenterBusinessRules {}
    private let billsPresenterBusinessRules = MockedBillsPresenterBusinessRules()

    override func tearDown() {
        super.tearDown()

    }

    func testRowFromBillBillResponse() {
        let billResponse = BillResponseFactory.create(id: 2)
        let actualResult = billsPresenterBusinessRules.convert(from: billResponse)
        XCTAssertEqual(billResponse.id, actualResult.id, "Not expected model")
    }
}
