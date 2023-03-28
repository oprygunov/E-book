//
//  WelcomeRouter.swift
//  E-book
//
//  Created by Oleg Prygunov on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class WelcomeRouter {
    weak var viewController: WelcomeViewController?
    var dataStore: WelcomeDataStore?

    init(viewController: WelcomeViewController, dataStore: WelcomeDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension WelcomeRouter: WelcomeRoutingLogic {
    func registration() {
        viewController?.navigationController?.pushViewController(SignUpBuilder.build(), animated: true)
    }
    
    func login() {

    }
}
