//
//  TimeZoneDetailViewControllerSpy.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 21/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class TimeZoneDetailViewControllerSpy: TimeZoneDetailViewControllerInput {

    var invokedViewModelUpdated = false
    var invokedViewModelUpdatedCount = 0
    var invokedViewModelUpdatedParameters: (viewModel: TimeZoneDetailViewModel.Content, Void)?
    var invokedViewModelUpdatedParametersList = [(viewModel: TimeZoneDetailViewModel.Content, Void)]()

    func viewModelUpdated(_ viewModel: TimeZoneDetailViewModel.Content) {
        invokedViewModelUpdated = true
        invokedViewModelUpdatedCount += 1
        invokedViewModelUpdatedParameters = (viewModel, ())
        invokedViewModelUpdatedParametersList.append((viewModel, ()))
    }
}
