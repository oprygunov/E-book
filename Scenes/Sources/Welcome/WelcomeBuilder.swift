//
//  WelcomeBuilder.swift
//  E-book
//
//  Created by Oleg Prygunov on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class WelcomeBuilder {
    static func build() -> UIViewController {
        let viewController = WelcomeViewController()
        let presenter = WelcomePresenter(view: viewController)
        let interactor = WelcomeInteractor(
            presenter: presenter,
            worker: WelcomeWorker()
        )
        let router = WelcomeRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
