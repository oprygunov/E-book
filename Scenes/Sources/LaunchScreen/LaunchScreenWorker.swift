//
//  LaunchScreenWorker.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

final class LaunchScreenWorker: LaunchScreenWorkingLogic {
    func fetch(_ completion: LaunchScreen.FetchCompletion?) {
        completion?(
            .success(
                .init(
                    didLogin: false
                )
            )
        )
    }
}
