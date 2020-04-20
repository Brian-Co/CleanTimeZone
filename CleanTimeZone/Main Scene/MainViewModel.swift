//
//  MainViewModel.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 17/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

enum MainViewModel {
    struct Content {
        let timesOpen: Int?
        let backgroundColor: MainBackgroundColor?
    }
    
    enum MainBackgroundColor: CaseIterable {
        case white
        case black
        case green
    }
}
