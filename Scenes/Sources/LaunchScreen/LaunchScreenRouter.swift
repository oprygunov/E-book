//
//  LaunchScreenRouter.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class LaunchScreenRouter {
    weak var viewController: LaunchScreenViewController?
    var dataStore: LaunchScreenDataStore?

    init(viewController: LaunchScreenViewController, dataStore: LaunchScreenDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension LaunchScreenRouter: LaunchScreenRoutingLogic {
    func showWelcome() {
        print("не залогинен")
        viewController?.navigationController?.viewControllers = [WelcomeBuilder.build()]
    }
    
    func showTabs() {
        print("залогинен")
        viewController?.navigationController?.viewControllers = [WelcomeBuilder.build()]
    }

}
