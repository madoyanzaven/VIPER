//
//  BillModel.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import UIKit

struct BillModel: Hashable {
    enum ImageData {
        case mobile
        case roaming

        var imageName: String {
            switch self {
            case .mobile:
                return "mobile_icon"
            case .roaming:
                return "roaming_icon"
            }
        }
    }
    let id: Int
    let title: String
    let priceDescription: String
    let imageData: ImageData

    var iconImage: UIImage? {
        return UIImage(named: imageData.imageName)
    }
}
