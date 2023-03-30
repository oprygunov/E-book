//
//  YourNameWorker.swift
//  E-book
//
//  Created by Vadim Mukhin on 29.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation
import SharedModels

var profileNew: UserProfile = .init(
    name: "",
    email: "",
    password: "",
    userPhoto: ""
)

private var profile: UserProfile {
    get {
        guard let new = SharedProfile.shared.profile else {
            SharedProfile.shared.profile = profileNew
            return profileNew
        }
        return new
    }
    set {
        SharedProfile.shared.profile = newValue
    }
}

final class YourNameWorker: YourNameWorkingLogic {

    func fetch(_ completion: YourName.Completion?) {
        let model = YourName.Model(
            profile: profile
        )
        completion?(model)
    }

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
