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

    func present(_ response: YourName.Fetch.Response) {
        view?.display(YourName.Fetch.ViewModel())
    }
    
    func present(_ response: YourName.NameText.Response) {
        view?.display(
            YourName.NameText.ViewModel(
                root: .init(
                    name: response.name,
                    isEnableButton: response.hasNotEmpty
                )
            )
        )
    }
    func present(_ response: YourName.SaveName.Response) {
    }
}

private extension YourName.Model {
    func viewModel(hasNotEmpty: Bool) -> YourName.RootViewModel {
       return .init(
            name: profile.name
        )
    }
}
