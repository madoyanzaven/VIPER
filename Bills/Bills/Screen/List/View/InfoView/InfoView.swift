//
//  InfoView.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import UIKit
import RxRelay

final class InfoView: UIView {
    @IBOutlet private weak var titleLabel: UILabel!
    let buttonActionPublishRelay = PublishRelay<Void>()

    @IBAction private func refreshButtonAction(_ sender: Any) {
        buttonActionPublishRelay.accept(())
    }
}

extension InfoView: Setupable {
    typealias SetupModel = MessageModel

    func setup(with model: SetupModel) {
        titleLabel.text = model.title
    }
}
