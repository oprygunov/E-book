//
//  CreateAccountModels.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

enum CreateAccount {
    enum Fetch {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    enum Close {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    enum CreateLogin {
        struct Request {
            var login: String
        }

        struct Response {
            var model: Model
            var hasNumber: Bool
            var hasMinimumCharacters: Bool
            var hasMatchingPasswords: Bool
        }

        struct ViewModel {
            var root: CreateAccount.RootViewModel
        }
    }

    enum CreatePassword {
        struct Request {
            var password: String
        }

        struct Response {
            var model: Model
            var hasNumber: Bool
            var hasMinimumCharacters: Bool
            var hasMatchingPasswords: Bool
            var isPasswordErrorState: Bool
        }

        struct ViewModel {
            var root: CreateAccount.RootViewModel
        }
    }

    enum ConfirmPassword {
        struct Request {
            var confirmedPassword: String
        }

        struct Response {
            var model: Model
            var hasNumber: Bool
            var hasMinimumCharacters: Bool
            var hasMatchingPasswords: Bool
            var isRePasswordErrorState: Bool
        }

        struct ViewModel {
            var root: CreateAccount.RootViewModel
        }
    }

    enum Enter {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    enum DoAccount {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    struct Model {
        struct UserDataModel {
            var mail: String
            var password: String
            var confirmedPassword: String
        }
        var userData: UserDataModel
    }

    struct RootViewModel {
        struct UserDataViewModel {
            var mail: String
            var password: String
            var confirmedPassword: String
            var iconHaveNumbers: Bool
            var iconMinimumCharacters: Bool
            var isEnableButton: Bool?
            var isPasswordErrorState: Bool?
            var isRePasswordErrorState: Bool?
        }
        var userData: UserDataViewModel
    }

    typealias SaveCompletion = () -> Void
}
