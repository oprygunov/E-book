//
//  YourNameViewController.swift
//  E-book
//
//  Created by Vadim Mukhin on 29.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class YourNameViewController: UIViewController {
    var interactor: YourNameBusinessLogic?
    var router: YourNameRoutingLogic?

    private lazy var rootView = YourNameView()

    override func loadView() {
        super.loadView()
        view = rootView
    }

}

extension YourNameViewController: YourNameDisplayLogic {
    func display(_ viewModel: YourName.Something.ViewModel) {

    }
}
