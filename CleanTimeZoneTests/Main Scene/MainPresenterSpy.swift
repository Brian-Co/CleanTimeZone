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
    
    var modelUpdatedCalled = false
    var colorUpdatedCalled = false
    
    func modelUpdated(_ timesOpen: Int?) {
        modelUpdatedCalled = true
    }
    
    func colorUpdated(_ color: MainViewModel.MainBackgroundColor?) {
        colorUpdatedCalled = true
    }
    
}
