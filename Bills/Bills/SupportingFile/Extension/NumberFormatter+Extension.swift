//
//  NumberFormatter+Extension.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

extension NumberFormatter {
    static func doubleToPriceFormat(_ doubleValue: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter.string(for: doubleValue)
    }
}
