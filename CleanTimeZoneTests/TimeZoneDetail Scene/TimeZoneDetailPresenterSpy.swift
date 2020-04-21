//
//  TimeZoneDetailPresenterSpy.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 21/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class TimeZoneDetailPresenterSpy: TimeZoneDetailPresenterInput {

    var invokedModelUpdated = false
    var invokedModelUpdatedCount = 0
    var invokedModelUpdatedParameters: (response: TimeZoneDetailResponse.Response, Void)?
    var invokedModelUpdatedParametersList = [(response: TimeZoneDetailResponse.Response, Void)]()

    func modelUpdated(with response: TimeZoneDetailResponse.Response) {
        invokedModelUpdated = true
        invokedModelUpdatedCount += 1
        invokedModelUpdatedParameters = (response, ())
        invokedModelUpdatedParametersList.append((response, ()))
    }
}
