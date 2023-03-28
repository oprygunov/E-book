//
//  CreateAccountView.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
import UIComponents

final class CreateAccountView: View {

    var viewModel: CreateAccount.RootViewModel = .init(
        userData: .init(
        mail: "",
        password: "",
        confirmedPassword: "",
        iconHaveNumbers: false,
        iconMinimumCharacters: false,
        isEnableButton: false,
        isPasswordErrorState: false,
        isRePasswordErrorState: false
        )
    ) {
        didSet {
            mailField.text = viewModel.userData.mail
            passwordField.text = viewModel.userData.password
            passwordField.isErrorState = viewModel.userData.isPasswordErrorState
            confirmedPasswordField.text = viewModel.userData.confirmedPassword
            confirmedPasswordField.isErrorState = viewModel.userData.isRePasswordErrorState
            checkView.hasNumber = viewModel.userData.iconHaveNumbers
            checkView.hasMinimumCharacters = viewModel.userData.iconMinimumCharacters
            button.isEnabled = viewModel.userData.isEnableButton ?? false
        }
    }

    public enum Action {
        case close
        case mail(String)
        case password(String)
        case confirmedPassword(String)
        case editEnd
    }

    public var actionHandler: (Action) -> Void = { _ in }

    private lazy var headerView: HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Создание аккаунта")
        view.actionHandler = { action in
            switch action {
            case .close:
                self.actionHandler(.close)
            case .more:
                break
            }
        }
        return view
    }()

    private lazy var mailField: LoginTextFieldView = {
        let view = LoginTextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(placeholderText: "vadik.flyfly@gmail.com", textLabel: "Электронная почта")
        view.actionHandler = { action in
            switch action {
            case .text(let text):
                self.actionHandler(.mail(text))
                print(text)
            case .editEnd:
                self.actionHandler(.editEnd)
            }
        }
        return view
    }()

    private lazy var passwordField: LoginTextFieldView = {
        let view = LoginTextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(placeholderText: "Придумайте пароль", isEyeIconHidden: false, isSecureText: true, textLabel: "Пароль")
        view.actionHandler = { action in
            switch action {
            case .text(let text):
                self.actionHandler(.password(text))
                print(text)
            case .editEnd:
                self.actionHandler(.editEnd)
            }
        }
        return view
    }()

    private let checkView: IconCheckView = {
        let view = IconCheckView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var confirmedPasswordField: LoginTextFieldView = {
        let view = LoginTextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(placeholderText: "Введите пароль", isEyeIconHidden: false, isSecureText: true, textLabel: "Подтвердите пароль")
        view.actionHandler = { action in
            switch action {
            case .text(let text):
                self.actionHandler(.confirmedPassword(text))
                print(text)
            case .editEnd:
                self.actionHandler(.editEnd)
            }
        }
        return view
    }()

    private let label: Label = {
        let view = Label(size: 16, font: .sfRegular)
        view.viewModel = .init(text: "Уже есть аккаунт?", textAlignment: .left, textColor: .textFirst)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var enterButton: Button = {
        let view = Button(text: "Войти", style: .none, size: .none)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private lazy var button: Button = {
        let view = Button(text: "Создать аккаунт", style: .primary, size: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.isEnabled = false
        return view
    }()

    override func setupContent() {
        super.setupContent()
        backgroundColor = .backgroundGeneral
        addSubview(headerView)
        addSubview(mailField)
        addSubview(passwordField)
        addSubview(checkView)
        addSubview(confirmedPasswordField)
        addSubview(label)
        addSubview(enterButton)
        addSubview(button)
    }

    override func setupLayout() {
        super.setupLayout()

        headerView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        headerView.leftAnchor ~= safeAreaLayoutGuide.leftAnchor
        headerView.rightAnchor ~= safeAreaLayoutGuide.rightAnchor

        mailField.topAnchor ~= headerView.bottomAnchor + 24
        mailField.leftAnchor ~= leftAnchor + 16
        mailField.rightAnchor ~= rightAnchor - 16

        passwordField.topAnchor ~= mailField.bottomAnchor + 18
        passwordField.leftAnchor ~= leftAnchor + 16
        passwordField.rightAnchor ~= rightAnchor - 16

        checkView.leftAnchor ~= leftAnchor
        checkView.topAnchor ~= passwordField.bottomAnchor + 9

        confirmedPasswordField.topAnchor ~= checkView.bottomAnchor + 19
        confirmedPasswordField.leftAnchor ~= leftAnchor + 16
        confirmedPasswordField.rightAnchor ~= rightAnchor - 16

        label.leftAnchor ~= leftAnchor + 40
        label.topAnchor ~= confirmedPasswordField.bottomAnchor + 26

        enterButton.leftAnchor ~= label.rightAnchor + 4
        enterButton.centerYAnchor ~= label.centerYAnchor


        button.leftAnchor ~= leftAnchor + 16
        button.rightAnchor ~= rightAnchor - 16
        button.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor

    }
}
