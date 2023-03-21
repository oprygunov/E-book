//
//  LaunchScreenInteractor.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

final class LaunchScreenInteractor {
    private let presenter: LaunchScreenPresentationLogic
    private let worker: LaunchScreenWorkingLogic

    init(presenter: LaunchScreenPresentationLogic, worker: LaunchScreenWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension LaunchScreenInteractor: LaunchScreenBusinessLogic {
    func request(_ request: LaunchScreen.Something.Request) {

    }
}

extension LaunchScreenInteractor: LaunchScreenDataStore {}
