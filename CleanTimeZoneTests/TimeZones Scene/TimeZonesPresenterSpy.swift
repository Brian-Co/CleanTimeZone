//
//  TimeZonesPresenterSpy.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 21/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class TimeZonesPresenterSpy: TimeZonesPresenterInput {

    var invokedModelUpdated = false
    var invokedModelUpdatedCount = 0
    var invokedModelUpdatedParameters: (response: TimeZonesResponse.Response, Void)?
    var invokedModelUpdatedParametersList = [(response: TimeZonesResponse.Response, Void)]()

    func modelUpdated(with response: TimeZonesResponse.Response) {
        invokedModelUpdated = true
        invokedModelUpdatedCount += 1
        invokedModelUpdatedParameters = (response, ())
        invokedModelUpdatedParametersList.append((response, ()))
    }
}
