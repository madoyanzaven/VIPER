//
//  BillTableViewCell.swift
//  BillsTask
//
//  Created by Zaven Madoyan on 23.01.24.
//

import UIKit

protocol Setupable {
    associatedtype Model
    func setup(with model: Model)
}

final class BillTableViewCell: UITableViewCell {
    @IBOutlet private weak var  titleLabel: UILabel!
    @IBOutlet private weak var  descriptionLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
}

extension BillTableViewCell: Setupable {
    typealias Model = BillModel

    func setup(with model: BillModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.priceDescription
        iconImageView.image =  model.iconImage
    }
}
