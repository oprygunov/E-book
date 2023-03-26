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

    init(presenter: CreateAccountPresentationLogic, worker: CreateAccountWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension CreateAccountInteractor: CreateAccountBusinessLogic {
    func request(_ request: CreateAccount.Something.Request) {

    }
}

extension CreateAccountInteractor: CreateAccountDataStore {}
