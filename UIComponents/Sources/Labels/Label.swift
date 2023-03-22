//
//  Label.swift
//  E-book
//
//  Created by Oleg Prygunov/Vadim Mukhin on 22.03.2023.
//

import UIKit

public class Label: UIView {

    private var namedFont: String = "PTRootUI-Regular"

    public struct Model {
        var text: String?
        var textAlignment: NSTextAlignment?
        var textColor: UIColor?

        public init(text: String? = nil, textAlignment: NSTextAlignment? = nil, textColor: UIColor? = nil) {
            self.text = text
            self.textAlignment = textAlignment
            self.textColor = textColor
        }
    }

    public var viewModel: Model = .init() {
        didSet {
            label.text = viewModel.text
            label.textAlignment = viewModel.textAlignment ?? .left
            label.textColor = viewModel.textColor
        }
    }

    public var textSize: CGFloat? {
        didSet {
            label.font = UIFont(name: "PTRootUI-Regular", size: textSize ?? 17)
        }
    }

    public var textFont: UIFont? {
        didSet {
            label.font = textFont
        }
    }

    public enum Fonts {
        case ptRootRegular
        case ptRootMedium
        case ceraBold
        case ceraMedium
        case sfRegular
        case sfSemibold
    }

    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()

   public init(size: CGFloat, font: Fonts) {
        switch font {
        case .ptRootRegular:
            namedFont = "PTRootUI-Regular"
        case .ptRootMedium:
            namedFont = "PTRootUI-Medium"
        case .ceraBold:
            namedFont = "CeraPro-Bold"
        case .ceraMedium:
            namedFont = "CeraPro-Medium"
        case .sfRegular:
            namedFont = "SFProText-Regular"
        case .sfSemibold:
            namedFont = "SFProText-Semibold"
        }
        super.init(frame: .zero)

        label.font = UIFont(name: namedFont, size: size)

        setupView()
        setupContent()
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        isUserInteractionEnabled = false
    }

    func setupContent() {
        addSubview(label)
    }

    func setupLayout() {
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    public override func setContentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
        label.setContentHuggingPriority(priority, for: axis)
    }

    public override func setContentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
        label.setContentCompressionResistancePriority(priority, for: axis)
    }
}


