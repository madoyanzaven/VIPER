//
//  CustomError.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation

enum CustomError {
    enum NetworkError: String, Error {
        case missingURL = "URL is nil."
        case unacceptableStatusCode = "Unacceptable Status Code."
        case emptyData = "Empty data."
        case unauthorized = "Unauthorized"
    }
}

extension CustomError {
    enum ParsingError: String, Error {
        case encodingFailed = "Data encoding failed."
        case decodingFailed = "Data decoding failed."
    }
}
