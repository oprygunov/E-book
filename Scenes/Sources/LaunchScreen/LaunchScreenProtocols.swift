//
//  LaunchScreenProtocols.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol LaunchScreenBusinessLogic: AnyObject {
    func request(_ request: LaunchScreen.Something.Request)
}

protocol LaunchScreenPresentationLogic: AnyObject {
    func present(_ response: LaunchScreen.Something.Response)
}

protocol LaunchScreenDisplayLogic: AnyObject {
    func display(_ viewModel: LaunchScreen.Something.ViewModel)
}

protocol LaunchScreenRoutingLogic: AnyObject {
    func show()
}

protocol LaunchScreenDataStore: AnyObject {}

protocol LaunchScreenWorkingLogic: AnyObject {}
