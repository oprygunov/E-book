//
//  LaunchScreenPresenter.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

final class LaunchScreenPresenter {
    weak var view: LaunchScreenDisplayLogic?

    init(view: LaunchScreenDisplayLogic) {
        self.view = view
    }
}

extension LaunchScreenPresenter: LaunchScreenPresentationLogic {
    func present(_ response: LaunchScreen.Something.Response) {
        view?.display(LaunchScreen.Something.ViewModel())
    }
}
