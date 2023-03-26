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
    
    private var model: LaunchScreen.Model?

    init(presenter: LaunchScreenPresentationLogic, worker: LaunchScreenWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension LaunchScreenInteractor: LaunchScreenBusinessLogic {
    func request(_ request: LaunchScreen.Fetch.Request) {

        let group = DispatchGroup()

        group.enter()
        //имитация работы загрузки приложения, 2 секунды ожидает и переходит дальше
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            group.leave()
        }

        group.notify(queue: .main) {
            self.worker.fetch { result in
                switch result {
                case .success(let model):
                    self.model = model
                case .failure:
                    break
                }
            }
            self.presenter.present(LaunchScreen.Fetch.Response(model: self.model))
        }
    }
}

extension LaunchScreenInteractor: LaunchScreenDataStore {}
