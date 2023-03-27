//
//  CreateAccountWorker.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation


final class CreateAccountWorker: CreateAccountWorkingLogic {
    func fetch(_ completion: CreateAccount.FetchCompletion?) {
        let model = CreateAccount.Model(
            userData: .init(
                mail:  "",
                password: "",
                confirmedPassword: ""))
        completion?(model)
    }
}
