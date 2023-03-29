//
//  YourNamePresenter.swift
//  E-book
//
//  Created by Vadim Mukhin on 29.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

final class YourNamePresenter {
    weak var view: YourNameDisplayLogic?

    init(view: YourNameDisplayLogic) {
        self.view = view
    }
}

extension YourNamePresenter: YourNamePresentationLogic {
    func present(_ response: YourName.Something.Response) {
        view?.display(YourName.Something.ViewModel())
    }
}
