//
//  UIView+LoadNib.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
