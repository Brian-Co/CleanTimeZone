//
//  TimeZonesPresenter.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 17/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

protocol TimeZonesPresenterInput: class {
    func modelUpdated(with response: TimeZonesResponse.Response)
}

final class TimeZonesPresenter {
    
    typealias Zone = TimeZonesViewModel.Content.Zone
    typealias Response = TimeZonesResponse.Response
    
    weak var viewController: TimeZonesViewControllerInput?
    
    init(viewController: TimeZonesViewControllerInput?) {
        self.viewController = viewController
    }
    
    func prepareData(_ response: Response) {
        
        let timeZones = response.zones.map { responseTimeZone -> Zone in
            
            let zoneName = responseTimeZone.zoneName.split(separator: "/")
            let city = String(zoneName.last ?? "")
            let country = responseTimeZone.countryName
            let continent = String(zoneName.first ?? "")
            let text = city + ", " + country
            let detailText = ""
            
            let timeZone = Zone(text: text, detailText: detailText, apiLink: responseTimeZone.zoneName, city: city, country: country, countryCode: responseTimeZone.countryCode, continent: continent, gmtOffset: responseTimeZone.gmtOffset, timestamp: responseTimeZone.timestamp)
            
            return timeZone
        }
        updateViewModel(with: timeZones)
    }
    
    func updateViewModel(with timeZones: [Zone]) {
        let viewModel = TimeZonesViewModel.Content(timeZones: timeZones)
        viewController?.viewModelUpdated(viewModel)
    }
}

extension TimeZonesPresenter: TimeZonesPresenterInput {
    func modelUpdated(with response: Response) {
        prepareData(response)
    }
}
