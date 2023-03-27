//
//  CreateAccountInteractor.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

final class CreateAccountInteractor {
    private let presenter: CreateAccountPresentationLogic
    private let worker: CreateAccountWorkingLogic
    private var model: CreateAccount.Model?
    private var mail: String = ""
    private var password: String = ""
    private var confirmPassword: String = ""

    init(presenter: CreateAccountPresentationLogic, worker: CreateAccountWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }

    private func hasNumber() -> Bool {
        return self.password.contains(where: { "0123456789".contains($0) })
    }

    private func hasMinimumCharacters() -> Bool {
        return self.password.count > 7
    }

    private func hasMatchingPasswords() -> Bool {
        return self.password == self.confirmPassword
    }
}

extension CreateAccountInteractor: CreateAccountBusinessLogic {

    func request(_ request: CreateAccount.Fetch.Request) {
        worker.fetch { [weak self] model in
            self?.password = model.userData.password
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(CreateAccount.Fetch.Response(
                    model: model,
                    hasNumber: self.hasNumber(),
                    hasMinimumCharacters: self.hasMinimumCharacters()
                    )
                )
            }
        }
    }

    func request(_ request: CreateAccount.createLogin.Request) {
        self.mail = request.login
        presenter.present(CreateAccount.createLogin.Response(
            model: .init(
                userData: .init(
                    mail: self.mail,
                    password: self.password,
                    confirmedPassword: self.confirmPassword)),
            hasNumber: self.hasNumber(),
            hasMinimumCharacters: hasMinimumCharacters()))
    }

    func request(_ request: CreateAccount.createPassword.Request) {
        self.password = request.password
        presenter.present(
            CreateAccount.createPassword.Response(
                model: .init(userData: .init(
                    mail: self.mail,
                    password: self.password,
                    confirmedPassword: self.confirmPassword)),
                hasNumber: self.hasNumber(),
                hasMinimumCharacters: hasMinimumCharacters()
            )
        )
    }

    func request(_ request: CreateAccount.confirmPassword.Request) {
        self.confirmPassword = request.confirmPassword
        presenter.present(CreateAccount.confirmPassword.Response(
            model: .init(
                userData: .init(
                    mail: self.mail,
                    password: self.password,
                    confirmedPassword: self.confirmPassword)),
            hasNumber: self.hasNumber(),
            hasMinimumCharacters: hasMinimumCharacters(),
            hasMatchingPasswords: self.hasMatchingPasswords()
        )
        )
    }

}

extension CreateAccountInteractor: CreateAccountDataStore {}
