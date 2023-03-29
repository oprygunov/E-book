//
//  YourNameProtocols.swift
//  E-book
//
//  Created by Vadim Mukhin on 29.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol YourNameBusinessLogic: AnyObject {
    func request(_ request: YourName.Something.Request)
}

protocol YourNamePresentationLogic: AnyObject {
    func present(_ response: YourName.Something.Response)
}

protocol YourNameDisplayLogic: AnyObject {
    func display(_ viewModel: YourName.Something.ViewModel)
}

protocol YourNameRoutingLogic: AnyObject {
    func show()
}

protocol YourNameDataStore: AnyObject {}

protocol YourNameWorkingLogic: AnyObject {}
