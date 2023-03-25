//
//  LaunchScreenProtocols.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol LaunchScreenBusinessLogic: AnyObject {
    func request(_ request: LaunchScreen.Fetch.Request)
}

protocol LaunchScreenPresentationLogic: AnyObject {
    func present(_ response: LaunchScreen.Fetch.Response)
}

protocol LaunchScreenDisplayLogic: AnyObject {
    func display(_ viewModel: LaunchScreen.Fetch.ViewModel)
}

protocol LaunchScreenRoutingLogic: AnyObject {
    func showWelcome()
    func showTabs()
}

protocol LaunchScreenDataStore: AnyObject {}

protocol LaunchScreenWorkingLogic: AnyObject {
    func fetch(_ completion: LaunchScreen.FetchCompletion?)
}
