//
//  TimeZonesViewModel.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 17/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

enum TimeZonesViewModel {
    
    struct Content {
        
        let timeZones: [Zone]
        
        struct Zone {
            let text: String
            let detailText: String
            let city: String
            let country: String
            let countryCode: String
            let continent: String
            let gmtOffset: Int
            let timestamp: Int
        }
    }
}
