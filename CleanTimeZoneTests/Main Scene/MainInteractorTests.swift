//
//  MainInteractorTests.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class MainInteractorTests: XCTest {
    var presenterSpy: MainPresenterSpy!
    var interactorUnderTesting: MainInteractor!

    override func setUp() {
        super.setUp()
        presenterSpy = MainPresenterSpy()
        interactorUnderTesting = MainInteractor(presenter: presenterSpy)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadContentShouldCallModelUpdated() {
        // Act
        interactorUnderTesting.loadContent()
        // Assert
        XCTAssert(presenterSpy.modelUpdatedCalled)
    }
    
    func testChangeBackgroundColorShouldCallColorUpdated() {
        // Act
        interactorUnderTesting.changeBackgroundColor()
        // Assert
        XCTAssert(presenterSpy.colorUpdatedCalled)
    }
    
}
