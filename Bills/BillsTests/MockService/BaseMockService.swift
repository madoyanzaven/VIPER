//
//  BaseMockService.swift
//  BillsTests
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

class BaseMockService {
    var fetchMethodCallCount = 0
    var shouldThrowError = false
}

enum MockError: Error {
    case failure
}
