//
//  CreateAccountViewController.swift
//  E-book
//
//  Created by Vadim Mukhin on 25.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class CreateAccountViewController: UIViewController {
    var interactor: CreateAccountBusinessLogic?
    var router: CreateAccountRoutingLogic?

    private let rootView = CreateAccountView()

    override func loadView() {
        super.loadView()
        view = rootView
    }

}

extension CreateAccountViewController: CreateAccountDisplayLogic {
    func display(_ viewModel: CreateAccount.Something.ViewModel) {

    }
}
