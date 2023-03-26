//
//  WelcomeProtocols.swift
//  E-book
//
//  Created by Oleg Prygunov on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol WelcomeBusinessLogic: AnyObject {
    func request(_ request: Welcome.Fetch.Request)
    func request(_ request: Welcome.Registration.Request)
    func request(_ request: Welcome.Login.Request)
}

protocol WelcomePresentationLogic: AnyObject {
    func present(_ response: Welcome.Fetch.Response)
    func present(_ response: Welcome.Registration.Response)
    func present(_ response: Welcome.Login.Response)
}

protocol WelcomeDisplayLogic: AnyObject {
    func display(_ viewModel: Welcome.Fetch.ViewModel)
    func display(_ viewModel: Welcome.Registration.ViewModel)
    func display(_ viewModel: Welcome.Login.ViewModel)
}

protocol WelcomeRoutingLogic: AnyObject {
    func registration()
    func login()
}

protocol WelcomeDataStore: AnyObject {}

protocol WelcomeWorkingLogic: AnyObject {}
