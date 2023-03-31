//
//  YourNameWorker.swift
//  E-book
//
//  Created by Vadim Mukhin on 29.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation
import SharedModels

final class YourNameWorker: YourNameWorkingLogic {

    func save(save: String, _ completion: YourName.SaveCompletion?) {
        guard let profile = SharedProfile.shared.profile else {
            return
        }
        SharedProfile.shared.profile = .init(
            name: save,
            email: profile.email,
            password: profile.password,
            userPhoto: profile.userPhoto
        )
        completion?()
    }
}
