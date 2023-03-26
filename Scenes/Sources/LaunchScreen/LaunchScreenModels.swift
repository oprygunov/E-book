//
//  LaunchScreenModels.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

enum LaunchScreen {
    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model?
        }

        struct ViewModel {
            var route: Route
        }
    }
    
    struct Model {
        var didLogin: Bool
    }
    
    enum Route {
        case welcome
        case tabs
    }
    
    typealias FetchCompletion = (Result<Model, Error>) -> Void
}
