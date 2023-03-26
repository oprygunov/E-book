//
//  CreateAccountBuilder.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

public final class CreateAccountBuilder {
   public static func build() -> UIViewController {
        let viewController = CreateAccountViewController()
        let presenter = CreateAccountPresenter(view: viewController)
        let interactor = CreateAccountInteractor(
            presenter: presenter,
            worker: CreateAccountWorker()
        )
        let router = CreateAccountRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
