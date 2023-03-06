//
//  BillListResponseFactory.swift
//  BillsTests
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

@testable import Bills

final class BillListResponseFactory {
    static func createBillResponse() -> [BillResponse] {
        return [BillResponseFactory.create()]
    }
}
