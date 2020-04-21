//
//  TimeZonesInteractorTests.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 21/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import CleanTimeZone

class TimeZonesInteractorTests: XCTestCase {
    var presenterSpy: TimeZonesPresenterSpyExpectation!
    var interactorUnderTesting: TimeZonesInteractor!
    
    override func setUp() {
        super.setUp()
        presenterSpy = TimeZonesPresenterSpyExpectation()
        interactorUnderTesting = TimeZonesInteractor(presenter: presenterSpy)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadContentShouldCallModelUpdated() {
        // Arrange
        presenterSpy.promise = expectation(description: #function)
        stub(condition: { (request) -> Bool in
            return request.url == URL(string: WSRequest.TimeZonesRequest.allTimeZones.url)
        }, response: { (request) -> HTTPStubsResponse in
            guard let stubData = TimeZonesInteractorTests.allTimeZonesJSON.data(using: .utf8) else {
                fatalError("\(#function) - Stub failed to parse string timeZonesJSON to data")
            }
            return HTTPStubsResponse(data: stubData, statusCode: 200, headers: ["Content-Type":"application/json"])
        })
        
        // Act
        interactorUnderTesting.loadContent()
        
        // Assert
        waitForExpectations(timeout: 2) { [weak self] (_) in
            let response: TimeZonesResponse.Response? = self?.presenterSpy.invokedModelUpdatedParameters?.response
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.zones[0].countryName, "Andorra")
            XCTAssertEqual(response?.zones[1].gmtOffset, 14400)
            XCTAssertEqual(response?.zones[2].zoneName, "Asia/Kabul")
        }
    }
    
    class TimeZonesPresenterSpyExpectation: TimeZonesPresenterSpy {
        var promise: XCTestExpectation?

        override func modelUpdated(with response: TimeZonesResponse.Response) {
            super.modelUpdated(with: response)
            promise?.fulfill()
        }
        
    }
    
    // MARK: - JSON
    static let allTimeZonesJSON = """
{
  "status": "OK",
  "message": "",
  "zones": [
    {
      "countryCode": "AD",
      "countryName": "Andorra",
      "zoneName": "Europe/Andorra",
      "gmtOffset": 7200,
      "timestamp": 1587480403
    },
    {
      "countryCode": "AE",
      "countryName": "United Arab Emirates",
      "zoneName": "Asia/Dubai",
      "gmtOffset": 14400,
      "timestamp": 1587487603
    },
    {
      "countryCode": "AF",
      "countryName": "Afghanistan",
      "zoneName": "Asia/Kabul",
      "gmtOffset": 16200,
      "timestamp": 1587489403
    },
    {
      "countryCode": "AG",
      "countryName": "Antigua and Barbuda",
      "zoneName": "America/Antigua",
      "gmtOffset": -14400,
      "timestamp": 1587458803
    }
  ]
}
"""
    
}
