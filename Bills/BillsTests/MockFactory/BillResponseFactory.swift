//
//  BillResponseFactory.swift
//  BillsTests
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

@testable import Bills

final class BillResponseFactory {
    static func create(id: Int = 1,
                       billType: BillResponse.BillType = BillResponse.BillType.mobile,
                       description: String = "",
                       amount: Double = 0) -> BillResponse {
        return BillResponse(id: id,
                            billType: billType,
                            description: description,
                            amount: amount)

    }
}
