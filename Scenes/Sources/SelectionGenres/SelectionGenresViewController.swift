//
//  SelectionGenresViewController.swift
//  E-book
//
//  Created by Oleg Prygunov on 28.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class SelectionGenresViewController: UIViewController {
    var interactor: SelectionGenresBusinessLogic?
    var router: SelectionGenresRoutingLogic?

    private lazy var rootView = SelectionGenresView()

    override func loadView() {
        super.loadView()
        view = rootView
        
        rootView.actionHandler = { action in
            switch action {
            case .selected(let index):
                self.interactor?.request(SelectionGenres.Selected.Request(index: index))
            case .continueButton:
                self.interactor?.request(SelectionGenres.Continue.Request())
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(SelectionGenres.Fetch.Request())
    }
}

extension SelectionGenresViewController: SelectionGenresDisplayLogic {
    func display(_ viewModel: SelectionGenres.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: SelectionGenres.Selected.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: SelectionGenres.Continue.ViewModel) {
        router?.continueButton()
    }
}
