//
//  CreateAccountViewController.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class CreateAccountViewController: UIViewController {
    var interactor: CreateAccountBusinessLogic?
    var router: CreateAccountRoutingLogic?

    private let rootView = CreateAccountView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .close:
                break
            case .mail(let text):
                self.interactor?.request(CreateAccount.createLogin.Request(login: text))
            case .password(let text):
                self.interactor?.request(CreateAccount.createPassword.Request(password: text))
            case .confirmedPassword(let text):
                self.interactor?.request(CreateAccount.confirmPassword.Request(confirmedPassword: text))
            case .editEnd:
                break
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(CreateAccount.Fetch.Request())
    }
}

extension CreateAccountViewController: CreateAccountDisplayLogic {

    func display(_ viewModel: CreateAccount.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    func display(_ viewModel: CreateAccount.createLogin.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    func display(_ viewModel: CreateAccount.createPassword.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    func display(_ viewModel: CreateAccount.confirmPassword.ViewModel) {
        rootView.viewModel = viewModel.root
    }

}
