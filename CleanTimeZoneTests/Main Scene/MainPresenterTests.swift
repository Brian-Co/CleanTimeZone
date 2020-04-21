//
//  MainPresenterTests.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class MainPresenterTests: XCTestCase {
    var viewControllerSpy: MainViewControllerSpy!
    var presenterUnderTesting: MainPresenter!

    override func setUp() {
        super.setUp()
        viewControllerSpy = MainViewControllerSpy()
        presenterUnderTesting = MainPresenter(viewController: viewControllerSpy)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testModelUpdatedWithValueShouldCallViewModelUpdated() {
        // Arrange
        let value = 10
        // Act
        presenterUnderTesting.modelUpdated(value)
        // Assert
        XCTAssert(viewControllerSpy.invokedViewModelUpdated)
        XCTAssertEqual(viewControllerSpy.invokedViewModelUpdatedParameters?.viewModel.mainText, "CleanTimeZone opened\r10 times")
    }
    
    func testModelUpdatedNilShouldCallViewModelUpdated() {
        // Act
        presenterUnderTesting.modelUpdated(nil)
        // Assert
        XCTAssert(viewControllerSpy.invokedViewModelUpdated)
        XCTAssertEqual(viewControllerSpy.invokedViewModelUpdatedParameters?.viewModel.mainText, "CleanTimeZone opened\rX times")
    }
    
    func testColorUpdatedWithValueShouldCallViewModelUpdated() {
        // Arrange
        let value = MainViewModel.MainBackgroundColor.white
        // Act
        presenterUnderTesting.colorUpdated(value)
        // Assert
        XCTAssert(viewControllerSpy.invokedViewModelUpdated)
        XCTAssertEqual(viewControllerSpy.invokedViewModelUpdatedParameters?.viewModel.backgroundColor, .white)
    }
    
    func testColorUpdatedNilShouldCallViewModelUpdated() {
        // Act
        presenterUnderTesting.colorUpdated(nil)
        // Assert
        XCTAssert(viewControllerSpy.invokedViewModelUpdated)
        XCTAssertEqual(viewControllerSpy.invokedViewModelUpdatedParameters?.viewModel.backgroundColor, nil)
    }
    
}

