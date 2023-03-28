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

        struct Response {
            var model: Model
            var hasNumber: Bool
            var hasMinimumCharacters: Bool
        }

        struct ViewModel {
            var root: CreateAccount.RootViewModel
        }
    }


    enum createLogin {
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

    enum createPassword {
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

    enum confirmPassword {
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

    struct AllFields {
        var mail: Bool
        var password: Bool
        var confirmedPassword: Bool
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

    typealias FetchCompletion = (Model) -> Void
}
