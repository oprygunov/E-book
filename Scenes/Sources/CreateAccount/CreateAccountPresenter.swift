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
    func present(_ response: CreateAccount.Something.Response) {
        view?.display(CreateAccount.Something.ViewModel())
    }
}
