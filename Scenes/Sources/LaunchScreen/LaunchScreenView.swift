//
//  LaunchScreenView.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import UIComponents

final class LaunchScreenView: View {
    
    private let welcomeLabel: Label = {
        let view = Label(size: 28, font: .ceraBold)
        view.textColor = .textFirst
        let text = "Добро пожаловать\nв мир книг"
        let attributedText = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 9
        paragraphStyle.alignment = .center
        attributedText.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: text.count)
        )
        let color = UIColor.buttonActive
        guard let color = color else { return view }
        attributedText.addAttribute(
            .foregroundColor,
            value: color,
            range: NSRange(location: 22, length: text.count - 22)
        )
        view.attributedText = attributedText
        view.heightAnchor ~= 70
        return view
    }()

    
    private let subTitleLabel: Label = {
        let view = Label(size: 16, font: .ptRootRegular)
        view.viewModel = .init(
            text: "Доступно 50 000 книг для чтения бесплатно. С платной подпиской можно читать литературу\nна иностранных языках",
            textAlignment: .center,
            textColor: .textFirst
        )
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            welcomeLabel,
            subTitleLabel
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.setCustomSpacing(12, after: welcomeLabel)
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .backgroundGeneral
        addSubview(stackView)
    }

    override func setupLayout() {
        super.setupLayout()

        stackView.topAnchor ~= centerYAnchor - 52
        stackView.leftAnchor ~= leftAnchor + 52
        stackView.rightAnchor ~= rightAnchor - 52
    }
}
