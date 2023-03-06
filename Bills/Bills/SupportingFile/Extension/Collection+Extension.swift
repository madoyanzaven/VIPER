//
//  Collection+Extension.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

extension Collection {
    subscript (safe index: Self.Index) -> Element? {
        guard indices.contains(index) else { return nil }

        return self[index]
    }
}
