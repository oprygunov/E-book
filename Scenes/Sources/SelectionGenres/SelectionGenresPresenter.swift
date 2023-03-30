//
//  SelectionGenresPresenter.swift
//  E-book
//
//  Created by Oleg Prygunov on 28.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

final class SelectionGenresPresenter {
    weak var view: SelectionGenresDisplayLogic?

    init(view: SelectionGenresDisplayLogic) {
        self.view = view
    }
}

extension SelectionGenresPresenter: SelectionGenresPresentationLogic {
    func present(_ response: SelectionGenres.Fetch.Response) {
        view?.display(SelectionGenres.Fetch.ViewModel(root: response.model.viewModel()))
    }
    
    func present(_ response: SelectionGenres.Selected.Response) {
        view?.display(SelectionGenres.Selected.ViewModel(root: response.model.viewModel()))
    }
    
    func present(_ response: SelectionGenres.Continue.Response) {
        view?.display(SelectionGenres.Continue.ViewModel())
    }
}

private extension SelectionGenres.Model {
    func viewModel() -> SelectionGenres.RootViewModel {
        .init(
            sections: [
                .genres(genres.map { item in
                    return .init(
                        id: item.id,
                        genres: item.genres,
                        isSelected: selectedGenres.contains(item.id)
                    )
                })
            ],
            userName: "Привет, \(userName)",
            canContinue: selectedGenres.count == 3 ? true : false
        )
    }
}
