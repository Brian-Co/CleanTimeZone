//
//  TimeZoneDetailResponse.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

enum TimeZoneDetailResponse {
    
    struct Response: Codable {
        
        let status: String
        let message: String
        let countryCode: String
        let countryName: String
        let zoneName: String
        let abbreviation: String
        let gmtOffset: Int
        let dst: String
        let zoneStart: Int
        let zoneEnd: Int?
        let nextAbbreviation: String?
        let timestamp: Int
        let formatted: String
        
    }
    
}
