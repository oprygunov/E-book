//
//  CreateAccountPresenter.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

final class CreateAccountPresenter {
    weak var view: CreateAccountDisplayLogic?

    init(view: CreateAccountDisplayLogic) {
        self.view = view
    }
}

extension CreateAccountPresenter: CreateAccountPresentationLogic {

    func present(_ response: CreateAccount.Fetch.Response) {
        view?.display(
            CreateAccount.Fetch.ViewModel(
                root: response.model.viewModel(
                    hasMinimumCharacters: response.hasMinimumCharacters,
                    hasNumber: response.hasNumber)
            )
        )
    }
    
    func present(_ response: CreateAccount.createLogin.Response) {
        view?.display(
            CreateAccount.createLogin.ViewModel(
                root: .init(
                    userData:
                            .init(
                                mail: response.model.userData.mail,
                                password: response.model.userData.password,
                                confirmedPassword: response.model.userData.confirmedPassword,
                                iconHaveNumbers: response.hasNumber,
                                iconMinimumCharacters: response.hasMinimumCharacters
                            )
                )
            )
        )
    }

    func present(_ response: CreateAccount.createPassword.Response) {
        view?.display(
            CreateAccount.createPassword.ViewModel(
                root: .init(
                    userData:
                            .init(
                                mail: response.model.userData.mail,
                                password: response.model.userData.password,
                                confirmedPassword: response.model.userData.confirmedPassword,
                                iconHaveNumbers: response.hasNumber,
                                iconMinimumCharacters: response.hasMinimumCharacters,
                                isEnableButton: response.hasNumber && response.hasMinimumCharacters && response.hasMatchingPasswords,
                                isPasswordErrorState: response.isPasswordErrorState
                            )
                )
            )
        )
    }

    func present(_ response: CreateAccount.confirmPassword.Response) {
        view?.display(
            CreateAccount.confirmPassword.ViewModel(
                root: .init(
                    userData:
                            .init(
                                mail: response.model.userData.mail,
                                password: response.model.userData.password,
                                confirmedPassword: response.model.userData.confirmedPassword,
                                iconHaveNumbers: response.hasNumber,
                                iconMinimumCharacters: response.hasMinimumCharacters,
                                isEnableButton: response.hasNumber && response.hasMinimumCharacters && response.hasMatchingPasswords,
                                isRePasswordErrorState: response.isRePasswordErrorState
                            )
                )
            )
        )
    }
}

private extension CreateAccount.Model {
    func viewModel(hasMinimumCharacters: Bool, hasNumber: Bool) -> CreateAccount.RootViewModel {
        return .init(
            userData: .init(
                mail: userData.mail,
                password: userData.password,
                confirmedPassword: userData.confirmedPassword,
                iconHaveNumbers: hasNumber,
                iconMinimumCharacters: hasMinimumCharacters,
                isEnableButton: false
            )
        )
    }
}
