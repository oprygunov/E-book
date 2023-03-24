//
//  File.swift
//  
//
//  Created by Vadim Mukhin on 22.03.2023.
//

import UIKit

public class LoginTextFieldView: UIView {

    public struct Model {
        var placeholderText: String?
        var eyeIconHidden: Bool?
        var secureText: Bool?
        var textLabel: String?

        public init(placeholderText: String? = nil,
                    eyeIconHidden: Bool? = nil,
                    secureText: Bool? = nil,
                    textLabel: String? = nil) {
            self.placeholderText = placeholderText
            self.eyeIconHidden = eyeIconHidden
            self.secureText = secureText
            self.textLabel = textLabel
        }
    }

    public var viewModel: Model = .init() {
        didSet {
            titleLabel.text = viewModel.textLabel
            loginTextField.viewModel.placeholderText = viewModel.placeholderText ?? "Введите ваш текст"
            loginTextField.viewModel.eyeIconHidden = viewModel.eyeIconHidden ?? true
            loginTextField.viewModel.secureText = viewModel.secureText ?? false
        }
    }

    public var enteredText: String? {
        didSet {
            loginTextField.text = enteredText
        }
    }

    public var inputErrorColor: Bool? {
        didSet {
            loginTextField.layer.borderColor = UIColor.error?.cgColor
        }
    }

    public var isEnabledField: Bool? {
        didSet {
            loginTextField.isEnabled = isEnabledField ?? true
        }
    }

    enum Action {
        case text(String)
    }

    var actionHandler: (Action) -> Void = {_ in }

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .textFirst
        view.font = UIFont(name: "SFProText-Regular", size: 16)
        return view
    }()

    private lazy var loginTextField: LoginTextField = {
        let view = LoginTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { action in
            switch action {
            case .text(let text):
                self.actionHandler(.text(text))
            }
        }
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .clear
        addSubview(loginTextField)
        addSubview(titleLabel)
        loginTextField.leftAnchor ~= leftAnchor
        loginTextField.rightAnchor ~= rightAnchor
        loginTextField.bottomAnchor ~= bottomAnchor
        titleLabel.leftAnchor ~= loginTextField.leftAnchor + 24
        titleLabel.topAnchor ~= topAnchor
        titleLabel.bottomAnchor ~= loginTextField.topAnchor - 10
    }
}

private class LoginTextField: UITextField {

    private let padding = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 70)

    struct Model {
        var placeholderText: String?
        var eyeIconHidden: Bool?
        var secureText: Bool?
    }

    var viewModel: Model = .init() {
        didSet {
            placeholder = viewModel.placeholderText ?? "Введите ваш текст"
            eyeButton.isHidden = viewModel.eyeIconHidden ?? true
            isSecureTextEntry = viewModel.secureText ?? false
        }
    }

    var enteredText: String? {
        didSet {
            self.text = enteredText
        }
    }

    var inputErrorColor: Bool? {
        didSet {
            layer.borderColor = UIColor.error?.cgColor
        }
    }

    var isEnabledField: Bool? {
        didSet {
            isEnabled = isEnabledField ?? true
        }
    }

    enum Action {
        case text(String)
    }

    var actionHandler: (Action) -> Void = {_ in }

    private lazy var eyeButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        view.tintColor = .textSecond
        view.addTarget(self, action: #selector(showButtonTapped), for: .touchUpInside)
        return view
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false
        rightView = eyeButton
        rightViewMode = .always
        isSecureTextEntry = true
        textColor = .textFirst
        backgroundColor = .backgroundTabBar
        layer.borderColor = UIColor.buttonOutlineDisable?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "Введите пароль", attributes: [NSAttributedString.Key.foregroundColor: .textSecond ?? UIColor.lightGray])
        tintColor = .ButtonActive
        font = UIFont(name: "SFProText-Regular", size: 16)
        addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.text(self.text ?? ""))
                }
            ),
            for: .allEditingEvents
        )
        heightAnchor ~= 44
    }

    @objc func showButtonTapped() {
        isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: isSecureTextEntry ? "eye.slash.fill" : "eye"), for: .normal)
    }

    public override func becomeFirstResponder() -> Bool {
        let isFirstResponder = super.becomeFirstResponder()
        if isFirstResponder {
            eyeButton.tintColor = .textFirst
            layer.borderColor = UIColor.buttonHover?.cgColor
        }
        return isFirstResponder
    }

    public override func resignFirstResponder() -> Bool {
        let isFirstResponder = super.resignFirstResponder()
        if isFirstResponder {
            eyeButton.tintColor = .textSecond
            layer.borderColor = UIColor.buttonOutlineDisable?.cgColor
        }
        return isFirstResponder
    }

    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rightFrame = super.rightViewRect(forBounds: bounds)
        rightFrame.origin.x -= 24
        return rightFrame
    }

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}


