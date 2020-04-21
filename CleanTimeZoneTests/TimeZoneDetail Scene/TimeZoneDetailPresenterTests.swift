//
//  TimeZoneDetailPresenterTests.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 21/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class TimeZoneDetailPresenterTests: XCTestCase {
    var viewControllerSpy: TimeZoneDetailViewControllerSpy!
    var presenterUnderTesting: TimeZoneDetailPresenter!

    override func setUp() {
        super.setUp()
        viewControllerSpy = TimeZoneDetailViewControllerSpy()
        presenterUnderTesting = TimeZoneDetailPresenter(viewController: viewControllerSpy)
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testModelUpdatedShouldCallViewModelUpdated() {
        // Arrange
        guard let data = TimeZoneDetailInteractorTests.parisTimeZoneJSON.data(using: .utf8), let response: TimeZoneDetailResponse.Response = WSRequest.Methods.decode(data) else { return }
        
        // Act
        presenterUnderTesting.modelUpdated(with: response)
        
        // Assert
        let expectedResponse = viewControllerSpy.invokedViewModelUpdatedParameters?.viewModel
        XCTAssertEqual(expectedResponse?.detailText, "Paris, France\rEurope\r\rmardi 21 avril 2020 à 17:21:20")
    }

}

