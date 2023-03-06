//
//  Environment.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

enum Environment {
    case all
    case empty
    case error

    static private var state = Environment.all

    static func setEnvState() {
#if ALL
        self.state = .all
#elseif EMPTY
        self.state = .empty
#elseif ERROR
        self.state = .error
#else
        preconditionFailure("Unknown envirement. Please check your configurations")
#endif
    }

    static var currentState: Self {
        return state
    }
}
