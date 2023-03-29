//
//  YourNameBuilder.swift
//  E-book
//
//  Created by Vadim Mukhin on 29.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class YourNameBuilder {
    static func build() -> UIViewController {
        let viewController = YourNameViewController()
        let presenter = YourNamePresenter(view: viewController)
        let interactor = YourNameInteractor(
            presenter: presenter,
            worker: YourNameWorker()
        )
        let router = YourNameRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
