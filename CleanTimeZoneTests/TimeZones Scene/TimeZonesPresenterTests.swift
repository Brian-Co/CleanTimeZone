//
//  TimeZonesPresenterTests.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 21/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class TimeZonesPresenterTests: XCTestCase {
    var viewControllerSpy: TimeZonesViewControllerSpy!
    var presenterUnderTesting: TimeZonesPresenter!

    override func setUp() {
        super.setUp()
        viewControllerSpy = TimeZonesViewControllerSpy()
        presenterUnderTesting = TimeZonesPresenter(viewController: viewControllerSpy)
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testModelUpdatedShouldCallViewModelUpdated() {
        // Arrange
        guard let data = TimeZonesInteractorTests.allTimeZonesJSON.data(using: .utf8), let response: TimeZonesResponse.Response = WSRequest.Methods.decode(data) else { return }
        
        // Act
        presenterUnderTesting.modelUpdated(with: response)
        
        // Assert
        let expectedResponse = viewControllerSpy.invokedViewModelUpdatedParameters?.viewModel
        XCTAssertEqual(expectedResponse?.timeZones[0].country, "Andorra")
        XCTAssertEqual(expectedResponse?.timeZones[1].city, "Dubai")
        XCTAssertEqual(expectedResponse?.timeZones[2].text, "Kabul, Afghanistan")
    }

}

