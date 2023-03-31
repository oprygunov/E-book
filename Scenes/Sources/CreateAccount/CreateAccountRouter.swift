//
//  CreateAccountRouter.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class CreateAccountRouter {
    weak var viewController: CreateAccountViewController?
    var dataStore: CreateAccountDataStore?

    init(viewController: CreateAccountViewController, dataStore: CreateAccountDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension CreateAccountRouter: CreateAccountRoutingLogic {
    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func enter() {
    }

    func doAccount() {
        viewController?.navigationController?.pushViewController(YourNameBuilder.build(), animated: true)
    }
}
