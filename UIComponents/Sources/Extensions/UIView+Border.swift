//
//  UIView+Border.swift
//  
//
//  Created by Vadim Mukhin on 25.03.2023.
//

import UIKit

public extension UIView {
    var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
    }
}
