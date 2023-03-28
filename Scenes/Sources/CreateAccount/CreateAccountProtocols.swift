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
    func request(_ request: CreateAccount.Close.Request)
    func request(_ request: CreateAccount.CreateLogin.Request)
    func request(_ request: CreateAccount.CreatePassword.Request)
    func request(_ request: CreateAccount.ConfirmPassword.Request)
    func request(_ request: CreateAccount.Enter.Request)
    func request(_ request: CreateAccount.DoAccount.Request)
}

protocol CreateAccountPresentationLogic: AnyObject {
    func present(_ response: CreateAccount.Fetch.Response)
    func present(_ response: CreateAccount.Close.Response)
    func present(_ response: CreateAccount.CreateLogin.Response)
    func present(_ response: CreateAccount.CreatePassword.Response)
    func present(_ response: CreateAccount.ConfirmPassword.Response)
    func present(_ response: CreateAccount.Enter.Response)
    func present(_ response: CreateAccount.DoAccount.Response)
}

protocol CreateAccountDisplayLogic: AnyObject {
    func display(_ viewModel: CreateAccount.Fetch.ViewModel)
    func display(_ viewModel: CreateAccount.Close.ViewModel)
    func display(_ viewModel: CreateAccount.CreateLogin.ViewModel)
    func display(_ viewModel: CreateAccount.CreatePassword.ViewModel)
    func display(_ viewModel: CreateAccount.ConfirmPassword.ViewModel)
    func display(_ viewModel: CreateAccount.Enter.ViewModel)
    func display(_ viewModel: CreateAccount.DoAccount.ViewModel)
}

protocol CreateAccountRoutingLogic: AnyObject {
    func close()
    func enter()
    func doAccount()
}

protocol CreateAccountDataStore: AnyObject {}

protocol CreateAccountWorkingLogic: AnyObject {
    func fetch(_ completion: CreateAccount.FetchCompletion?)

}
