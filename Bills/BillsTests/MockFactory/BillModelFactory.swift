//
//  BillModelFactory.swift
//  BillsTests
//
//  Created by Zaven Madoyan on 24.01.23.
//

import Foundation

@testable import Bills

final class BillModelFactory {
    static func create(id: Int,
                       title: String = "",
                       priceDescription: String = "",
                       imageData: BillModel.ImageData = BillModel.ImageData.mobile) -> BillModel { return BillModel(id: id,
                                      title: title,
                                      priceDescription: priceDescription,
                                      imageData: imageData)
    }
}
