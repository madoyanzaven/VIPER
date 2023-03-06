//
//  Constants.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

enum Constants {
    enum API {
        case bills

        var path: String {
            switch self {
            case .bills:
                return getPathByEnviroment()
            }
        }

        // all bills: /all
        // no bills: /empty
        // error: /error
        private func getPathByEnviroment() -> String {
            let enviroment = Environment.currentState
            switch enviroment {
            case .all:
                return "/all"
            case .empty:
                return "/empty"
            case .error:
                return "/error"
            }
        }
    }
}

extension Constants {
    enum BaseUrl {
        static var bills = "https://bills.chipp.dev"
    }
}
