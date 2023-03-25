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
    func present(_ response: LaunchScreen.Fetch.Response) {
        view?.display(
            LaunchScreen.Fetch.ViewModel(
                route: response.model?.route() ?? .welcome
            )
        )
    }
}

private extension LaunchScreen.Model {
    func route() -> LaunchScreen.Route {
        if didLogin {
            return .tabs
        }
        else {
            return .welcome
        }
    }
}
