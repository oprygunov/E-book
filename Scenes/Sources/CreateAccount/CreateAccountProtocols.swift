//
//  CreateAccountProtocols.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol CreateAccountBusinessLogic: AnyObject {
    func request(_ request: CreateAccount.Fetch.Request)
    func request(_ request: CreateAccount.createLogin.Request)
    func request(_ request: CreateAccount.createPassword.Request)
    func request(_ request: CreateAccount.confirmPassword.Request)
}

protocol CreateAccountPresentationLogic: AnyObject {
    func present(_ response: CreateAccount.Fetch.Response)
    func present(_ response: CreateAccount.createLogin.Response)
    func present(_ response: CreateAccount.createPassword.Response)
    func present(_ response: CreateAccount.confirmPassword.Response)
}

protocol CreateAccountDisplayLogic: AnyObject {
    func display(_ viewModel: CreateAccount.Fetch.ViewModel)
    func display(_ viewModel: CreateAccount.createLogin.ViewModel)
    func display(_ viewModel: CreateAccount.createPassword.ViewModel)
    func display(_ viewModel: CreateAccount.confirmPassword.ViewModel)
}

protocol CreateAccountRoutingLogic: AnyObject {
    func show()
}

protocol CreateAccountDataStore: AnyObject {}

protocol CreateAccountWorkingLogic: AnyObject {
    func fetch(_ completion: CreateAccount.FetchCompletion?)

}
