//
//  SelectionGenresProtocols.swift
//  E-book
//
//  Created by Oleg Prygunov on 28.03.2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

protocol SelectionGenresBusinessLogic: AnyObject {
    func request(_ request: SelectionGenres.Fetch.Request)
    func request(_ request: SelectionGenres.Selected.Request)
    func request(_ request: SelectionGenres.Continue.Request)
}

protocol SelectionGenresPresentationLogic: AnyObject {
    func present(_ response: SelectionGenres.Fetch.Response)
    func present(_ response: SelectionGenres.Selected.Response)
    func present(_ response: SelectionGenres.Continue.Response)
}

protocol SelectionGenresDisplayLogic: AnyObject {
    func display(_ viewModel: SelectionGenres.Fetch.ViewModel)
    func display(_ viewModel: SelectionGenres.Selected.ViewModel)
    func display(_ viewModel: SelectionGenres.Continue.ViewModel)
}

protocol SelectionGenresRoutingLogic: AnyObject {
    func continueButton()
}

protocol SelectionGenresDataStore: AnyObject {}

protocol SelectionGenresWorkingLogic: AnyObject {
    func fetch(_ completion: SelectionGenres.Completion?)
    func apply(selectedGenres: Set<Int>, completion: SelectionGenres.EmptyCompletion?)
}
