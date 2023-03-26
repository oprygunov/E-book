//
//  WelcomePresenter.swift
//  E-book
//
//  Created by Oleg Prygunov on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

final class WelcomePresenter {
    weak var view: WelcomeDisplayLogic?

    init(view: WelcomeDisplayLogic) {
        self.view = view
    }
}

extension WelcomePresenter: WelcomePresentationLogic {
    func present(_ response: Welcome.Fetch.Response) {
        view?.display(Welcome.Fetch.ViewModel())
    }
    
    func present(_ response: Welcome.Registration.Response) {
        view?.display(Welcome.Registration.ViewModel())
    }
    
    func present(_ response: Welcome.Login.Response) {
        view?.display(Welcome.Login.ViewModel())
    }
}
