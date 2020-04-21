//
//  TimeZoneDetailInteractorTests.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 21/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import CleanTimeZone

class TimeZoneDetailInteractorTests: XCTestCase {
    var presenterSpy: TimeZoneDetailPresenterSpyExpectation!
    var interactorUnderTesting: TimeZoneDetailInteractor!

    override func setUp() {
        super.setUp()
        presenterSpy = TimeZoneDetailPresenterSpyExpectation()
        interactorUnderTesting = TimeZoneDetailInteractor(presenter: presenterSpy)
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testLoadContentShouldCallModelUpdated() {
        // Arrange
        presenterSpy.promise = expectation(description: #function)
        let apiLink = "Europe/Paris"
        let url = URL(string: WSRequest.TimeZonesRequest.timeZoneDetail.url + apiLink)
        stub(condition: { (request) -> Bool in
            return request.url == url
        }, response: { (request) -> HTTPStubsResponse in
            guard let stubData = TimeZoneDetailInteractorTests.parisTimeZoneJSON.data(using: .utf8) else {
                fatalError("\(#function) - Stub failed to parse string timeZonesJSON to data")
            }
            return HTTPStubsResponse(data: stubData, statusCode: 200, headers: ["Content-Type":"application/json"])
        })
        
        
        // Act
        interactorUnderTesting.loadContent(apiLink)
        
        // Assert
        waitForExpectations(timeout: 2) { [weak self] (_) in
            let response: TimeZoneDetailResponse.Response? = self?.presenterSpy.invokedModelUpdatedParameters?.response
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.countryName, "France")
            XCTAssertEqual(response?.formatted, "2020-04-21 17:21:20")
            XCTAssertEqual(response?.timestamp, 1587489680)
        }
    }
    
    func testLoadContentNilShouldNotCallModelUpdated() {
        // Arrange
        let apiLink: String? = nil
        
        // Act
        interactorUnderTesting.loadContent(apiLink)
        
        // Assert
        XCTAssert(!presenterSpy.invokedModelUpdated)
    }
    
    class TimeZoneDetailPresenterSpyExpectation: TimeZoneDetailPresenterSpy {
        var promise: XCTestExpectation?
        
        override func modelUpdated(with response: TimeZoneDetailResponse.Response) {
            super.modelUpdated(with: response)
            promise?.fulfill()
        }
    }
    
    static let parisTimeZoneJSON = """
{
  "status": "OK",
  "message": "",
  "countryCode": "FR",
  "countryName": "France",
  "zoneName": "Europe/Paris",
  "abbreviation": "CEST",
  "gmtOffset": 7200,
  "dst": "1",
  "zoneStart": 1585443600,
  "zoneEnd": 1603587599,
  "nextAbbreviation": "CET",
  "timestamp": 1587489680,
  "formatted": "2020-04-21 17:21:20"
}
"""
    
}
