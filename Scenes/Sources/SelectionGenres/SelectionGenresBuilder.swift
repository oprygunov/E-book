//
//  SelectionGenresBuilder.swift
//  E-book
//
//  Created by Oleg Prygunov on 28.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

public final class SelectionGenresBuilder {
    public static func build() -> UIViewController {
        let viewController = SelectionGenresViewController()
        let presenter = SelectionGenresPresenter(view: viewController)
        let interactor = SelectionGenresInteractor(
            presenter: presenter,
            worker: SelectionGenresWorker()
        )
        let router = SelectionGenresRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
