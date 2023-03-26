//
//  WelcomeInteractor.swift
//  E-book
//
//  Created by Oleg Prygunov on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

final class WelcomeInteractor {
    private let presenter: WelcomePresentationLogic
    private let worker: WelcomeWorkingLogic

    init(presenter: WelcomePresentationLogic, worker: WelcomeWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension WelcomeInteractor: WelcomeBusinessLogic {
    func request(_ request: Welcome.Fetch.Request) {
        presenter.present(Welcome.Fetch.Response())
    }
    
    func request(_ request: Welcome.Registration.Request) {
        presenter.present(Welcome.Registration.Response())
    }
    
    func request(_ request: Welcome.Login.Request) {
        presenter.present(Welcome.Login.Response())
    }
}

extension WelcomeInteractor: WelcomeDataStore {}
