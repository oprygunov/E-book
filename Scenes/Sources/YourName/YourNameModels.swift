//
//  YourNameModels.swift
//  E-book
//
//  Created by Vadim Mukhin on 29.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation
import SharedModels

enum YourName {
    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model
        }

        struct ViewModel {
            var root: RootViewModel
        }
    }

    enum NameText {
        struct Request {
            var name: String
        }

        struct Response {
            var name: String
            var hasNotEmpty: Bool
        }

        struct ViewModel {
            var root: RootViewModel
        }
    }

    enum SaveName {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    struct Model {
        var profile: UserProfile
    }

    struct RootViewModel {
        var name: String
        var isEnableButton: Bool?
    }

    typealias Completion = (Model) -> Void
    typealias SaveCompletion = () -> Void
}
