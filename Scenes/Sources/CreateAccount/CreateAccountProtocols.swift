//
//  CreateAccountProtocols.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol CreateAccountBusinessLogic: AnyObject {
    func request(_ request: CreateAccount.Something.Request)
}

protocol CreateAccountPresentationLogic: AnyObject {
    func present(_ response: CreateAccount.Something.Response)
}

protocol CreateAccountDisplayLogic: AnyObject {
    func display(_ viewModel: CreateAccount.Something.ViewModel)
}

protocol CreateAccountRoutingLogic: AnyObject {
    func show()
}

protocol CreateAccountDataStore: AnyObject {}

protocol CreateAccountWorkingLogic: AnyObject {}
