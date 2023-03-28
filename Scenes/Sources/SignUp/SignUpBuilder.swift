//
//  SignUpBuilder.swift
//  E-book
//
//  Created by Oleg Prygunov on 27.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class SignUpBuilder {
    static func build() -> UIViewController {
        let viewController = SignUpViewController()
        let presenter = SignUpPresenter(view: viewController)
        let interactor = SignUpInteractor(
            presenter: presenter,
            worker: SignUpWorker()
        )
        let router = SignUpRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
