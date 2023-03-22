//
//  File.swift
//  
//
//  Created by Vadim Mukhin on 21.03.2023.
//

import UIKit

public extension UIColor {
    static var backgroundAlerts: UIColor? {
        .init(named: "backgroundAlerts", in: Bundle.module, compatibleWith: nil)
    }
    static var backgroundGeneral: UIColor? {
        .init(named: "backgroundGeneral", in: Bundle.module, compatibleWith: nil)
    }
    static var backgroundListenMode: UIColor? {
        .init(named: "backgroundListenMode", in: Bundle.module, compatibleWith: nil)
    }
    static var backgroundReaderMode: UIColor? {
        .init(named: "backgroundReaderMode", in: Bundle.module, compatibleWith: nil)
    }
    static var backgroundSelected: UIColor? {
        .init(named: "backgroundSelected", in: Bundle.module, compatibleWith: nil)
    }
    static var backgroundSnackBars: UIColor? {
        .init(named: "backgroundSnackBars", in: Bundle.module, compatibleWith: nil)
    }
    static var backgroundTabBar: UIColor? {
        .init(named: "backgroundTabBar", in: Bundle.module, compatibleWith: nil)
    }
    static var ButtonActive: UIColor? {
        .init(named: "ButtonActive", in: Bundle.module, compatibleWith: nil)
    }
    static var buttonDisable: UIColor? {
        .init(named: "buttonDisable", in: Bundle.module, compatibleWith: nil)
    }
    static var buttonHover: UIColor? {
        .init(named: "buttonHover", in: Bundle.module, compatibleWith: nil)
    }
    static var buttonOutlineActive: UIColor? {
        .init(named: "buttonOutlineActive", in: Bundle.module, compatibleWith: nil)
    }
    static var buttonOutlineDisable: UIColor? {
        .init(named: "buttonOutlineDisable", in: Bundle.module, compatibleWith: nil)
    }
    static var buttonOutlineHover: UIColor? {
        .init(named: "buttonOutlineHover", in: Bundle.module, compatibleWith: nil)
    }
    static var buttonSign: UIColor? {
        .init(named: "buttonSign", in: Bundle.module, compatibleWith: nil)
    }
    static var emptyStar: UIColor? {
        .init(named: "emptyStar", in: Bundle.module, compatibleWith: nil)
    }
    static var error: UIColor? {
        .init(named: "error", in: Bundle.module, compatibleWith: nil)
    }
    static var separator: UIColor? {
        .init(named: "separator", in: Bundle.module, compatibleWith: nil)
    }
    static var star: UIColor? {
        .init(named: "star", in: Bundle.module, compatibleWith: nil)
    }
    static var success: UIColor? {
        .init(named: "success", in: Bundle.module, compatibleWith: nil)
    }
    static var textFirst: UIColor? {
        .init(named: "textFirst", in: Bundle.module, compatibleWith: nil)
    }
    static var textSecond: UIColor? {
        .init(named: "textSecond", in: Bundle.module, compatibleWith: nil)
    }
}

public func Image(named name: String) -> UIImage? {
    UIImage(named: name, in: Bundle.module, compatibleWith: nil)
}
