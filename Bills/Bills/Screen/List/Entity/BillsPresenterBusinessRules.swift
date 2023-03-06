//
//  BillsPresenterBussunessRuls.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

protocol BillsPresenterBusinessRules {
    func convert(from billResponse: BillResponse) -> BillModel
}

extension BillsPresenterBusinessRules {
    func convert(from billResponse: BillResponse) -> BillModel {
        let formattedPrice = NumberFormatter.doubleToPriceFormat(billResponse.amount)
        let priceDescription = formattedPrice?.addCurrencyPrefix() ?? ""

        return BillModel(
            id: billResponse.id,
            title: billResponse.description,
            priceDescription: priceDescription,
            imageData: billResponse.billType == .mobile ? .mobile : .roaming
        )
    }
}
