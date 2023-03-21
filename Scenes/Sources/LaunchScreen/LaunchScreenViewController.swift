//
//  LaunchScreenViewController.swift
//  E-book
//
//  Created by Oleg Prygunov on 21.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class LaunchScreenViewController: UIViewController {
    var interactor: LaunchScreenBusinessLogic?
    var router: LaunchScreenRoutingLogic?

    private let rootView = LaunchScreenView()

    override func loadView() {
        super.loadView()
        view = rootView
    }

}

extension LaunchScreenViewController: LaunchScreenDisplayLogic {
    func display(_ viewModel: LaunchScreen.Something.ViewModel) {

    }
}
