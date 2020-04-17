//
//  TimeZonesResponse.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 17/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

enum TimeZonesResponse {
    
    struct Response: Codable {
        
        let status: String
        let message: String
        
        let zones: [Zone]
        
        struct Zone: Codable {
            let countryCode: String
            let countryName: String
            let zoneName: String
            let gmtOffset: Int
            let timestamp: Int
        }
        
    }
    
}
