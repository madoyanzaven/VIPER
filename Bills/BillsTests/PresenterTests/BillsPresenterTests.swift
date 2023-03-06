//
//  BillsPresenterTests.swift
//  BillsTests
//
//  Created by Zaven Madoyan on 24.01.23.
//
//

import XCTest
import RxSwift

@testable import Bills

class BillsPresenterTests: XCTestCase {
    var presenter: BillsPresenter!
    var service: MockBillsService!
    
    override func setUp() {
        super.setUp()
        
        service = MockBillsService()
        let billsInteractor = MockBillsInteractor(service: service)
        presenter = BillsPresenter(
            interactor: billsInteractor,
            coordinator: MainCoordinatorFactory.make()
        )
    }
    
    override func tearDown() {
        super.tearDown()
        
        presenter = nil
        service = nil
    }
    
    func testFetchData() {
        XCTAssertEqual(service.fetchMethodCallCount, 0, "fetchMethodCallCount default value is 0, fetch count is \(service.fetchMethodCallCount)")

        presenter.onViewDidLoad()

        XCTAssertEqual(service.fetchMethodCallCount, 1, "fetchMethodCallCount is  \(service.fetchMethodCallCount), expected value: 1")
    }
}
