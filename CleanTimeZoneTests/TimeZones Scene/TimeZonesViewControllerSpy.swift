//
//  TimeZonesViewControllerSpy.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 21/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class TimeZonesViewControllerSpy: TimeZonesViewControllerInput {

    var invokedViewModelUpdated = false
    var invokedViewModelUpdatedCount = 0
    var invokedViewModelUpdatedParameters: (viewModel: TimeZonesViewModel.Content, Void)?
    var invokedViewModelUpdatedParametersList = [(viewModel: TimeZonesViewModel.Content, Void)]()

    func viewModelUpdated(_ viewModel: TimeZonesViewModel.Content) {
        invokedViewModelUpdated = true
        invokedViewModelUpdatedCount += 1
        invokedViewModelUpdatedParameters = (viewModel, ())
        invokedViewModelUpdatedParametersList.append((viewModel, ()))
    }
}
