//
//  YourNameInteractor.swift
//  E-book
//
//  Created by Vadim Mukhin on 29.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

final class YourNameInteractor {
    private let presenter: YourNamePresentationLogic
    private let worker: YourNameWorkingLogic

    init(presenter: YourNamePresentationLogic, worker: YourNameWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension YourNameInteractor: YourNameBusinessLogic {
    func request(_ request: YourName.Something.Request) {

    }
}

extension YourNameInteractor: YourNameDataStore {}
