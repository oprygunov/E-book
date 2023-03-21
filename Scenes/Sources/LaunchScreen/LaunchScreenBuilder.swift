//
//  LaunchScreenBuilder.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

public final class LaunchScreenBuilder {
    public static func build() -> UIViewController {
        let viewController = LaunchScreenViewController()
        let presenter = LaunchScreenPresenter(view: viewController)
        let interactor = LaunchScreenInteractor(
            presenter: presenter,
            worker: LaunchScreenWorker()
        )
        let router = LaunchScreenRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
