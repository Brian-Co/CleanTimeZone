//
//  MainPresenter.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 17/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

protocol MainPresenterInput: class {
    func modelUpdated(_ timesOpen: Int?, _ color: MainViewModel.MainBackgroundColor?)
}

final class MainPresenter {
    weak var viewController: MainViewControllerInput?

    init(viewController: MainViewControllerInput?) {
        self.viewController = viewController
    }
}

extension MainPresenter: MainPresenterInput {
    
    func modelUpdated(_ timesOpen: Int?, _ color: MainViewModel.MainBackgroundColor?) {
        let viewModel = MainViewModel.Content(timesOpen: timesOpen, backgroundColor: color)
        viewController?.viewModelUpdated(viewModel)
    }
}
