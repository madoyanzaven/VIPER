//
//  String+Extension.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

extension String {
    func addCurrencyPrefix() -> String {
        return "€" + self
    }
}
