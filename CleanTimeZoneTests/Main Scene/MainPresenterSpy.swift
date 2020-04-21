//
//  MainPresenterSpy.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class MainPresenterSpy: MainPresenterInput {

    var invokedModelUpdated = false
    var invokedModelUpdatedCount = 0
    var invokedModelUpdatedParameters: (timesOpen: Int?, Void)?
    var invokedModelUpdatedParametersList = [(timesOpen: Int?, Void)]()

    func modelUpdated(_ timesOpen: Int?) {
        invokedModelUpdated = true
        invokedModelUpdatedCount += 1
        invokedModelUpdatedParameters = (timesOpen, ())
        invokedModelUpdatedParametersList.append((timesOpen, ()))
    }

    var invokedColorUpdated = false
    var invokedColorUpdatedCount = 0
    var invokedColorUpdatedParameters: (color: MainViewModel.MainBackgroundColor?, Void)?
    var invokedColorUpdatedParametersList = [(color: MainViewModel.MainBackgroundColor?, Void)]()

    func colorUpdated(_ color: MainViewModel.MainBackgroundColor?) {
        invokedColorUpdated = true
        invokedColorUpdatedCount += 1
        invokedColorUpdatedParameters = (color, ())
        invokedColorUpdatedParametersList.append((color, ()))
    }
}
