//
//  NetworkError.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

enum NetworkError: String, Error {
    case missingURL = "URL is nil."
    case unacceptableStatusCode = "Unacceptable Status Code."
    case emptyData = "Empty data."
    case unauthorized = "Unauthorized"
}

enum ParsingError: Error {
    case format

    var text: String {
        switch self {
        case .format:
            return "The data couldn't be read because it isn't in the correct format."
        }
    }

}
