//
//  YourNameRouter.swift
//  E-book
//
//  Created by Vadim Mukhin on 29.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class YourNameRouter {
    weak var viewController: YourNameViewController?
    var dataStore: YourNameDataStore?

    init(viewController: YourNameViewController, dataStore: YourNameDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension YourNameRouter: YourNameRoutingLogic {
    func save() {

    }
}
