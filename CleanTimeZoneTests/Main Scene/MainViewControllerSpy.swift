//
//  MainViewControllerSpy.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import XCTest
@testable import CleanTimeZone

class MainViewControllerSpy: MainViewControllerInput {
    
    var viewModelUpdatedCalled = false
    
    func viewModelUpdated(_ viewModel: MainViewModel.Content, _ changedContent: MainViewModel.ChangedContent) {
        viewModelUpdatedCalled = true
    }

}
