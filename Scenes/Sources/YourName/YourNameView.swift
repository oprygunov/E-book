//
//  YourNameView.swift
//  E-book
//
//  Created by Vadim Mukhin on 29.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import UIComponents

final class YourNameView: View {

    enum Action {
        case save
    }

    var actionHandler: (Action) -> Void = { _ in }

    private let image: UIImageView = {
        let view = UIImageView()
        view.image = Image(named: "AccountSettings")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let label: Label = {
        let view = Label(size: 28, font: .ceraBold)
        view.viewModel = .init(
            text: "Как к тебе обращаться?",
            textAlignment: .center,
            textColor: .textFirst
        )
        return view
    }()

    private lazy var textField: LoginTextFieldView = {
        let view = LoginTextFieldView()
        view.viewModel = .init(placeholderText: "Ваше имя", isEyeIconHidden: true, isSecureText: false)
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            image,
            label,
            textField
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        return view
    }()

    private lazy var saveButton: Button = {
        let view = Button(
            text: "Сохранить",
            style: .primary,
            size: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = {
            self.actionHandler(.save)
        }
        return view
    }()

    override func setupContent() {
        super.setupContent()
        backgroundColor = .backgroundGeneral
        addSubview(stackView)
        addSubview(saveButton)
    }

    override func setupLayout() {
        super.setupLayout()

        stackView.topAnchor ~= safeAreaLayoutGuide.topAnchor + 62
        stackView.leftAnchor ~= leftAnchor + 22
        stackView.rightAnchor ~= rightAnchor - 22

        saveButton.leftAnchor ~= leftAnchor + 16
        saveButton.rightAnchor ~= rightAnchor - 16
        saveButton.bottomAnchor <= bottomAnchor - 16
        let bottom = saveButton.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        bottom.priority = .defaultHigh
    }
}
