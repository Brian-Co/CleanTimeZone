//
//  MainViewControllerSpy.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class MainViewControllerSpy: MainViewControllerInput {

    var invokedViewModelUpdated = false
    var invokedViewModelUpdatedCount = 0
    var invokedViewModelUpdatedParameters: (viewModel: MainViewModel.Content, changedContent: MainViewModel.ChangedContent)?
    var invokedViewModelUpdatedParametersList = [(viewModel: MainViewModel.Content, changedContent: MainViewModel.ChangedContent)]()

    func viewModelUpdated(_ viewModel: MainViewModel.Content, _ changedContent: MainViewModel.ChangedContent) {
        invokedViewModelUpdated = true
        invokedViewModelUpdatedCount += 1
        invokedViewModelUpdatedParameters = (viewModel, changedContent)
        invokedViewModelUpdatedParametersList.append((viewModel, changedContent))
    }
}
