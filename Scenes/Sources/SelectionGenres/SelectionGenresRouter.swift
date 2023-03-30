//
//  SelectionGenresRouter.swift
//  E-book
//
//  Created by Oleg Prygunov on 28.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

final class SelectionGenresRouter {
    weak var viewController: SelectionGenresViewController?
    var dataStore: SelectionGenresDataStore?

    init(viewController: SelectionGenresViewController, dataStore: SelectionGenresDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension SelectionGenresRouter: SelectionGenresRoutingLogic {
    func continueButton() {

    }
}
