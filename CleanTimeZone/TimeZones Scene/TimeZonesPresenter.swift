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
    weak var viewController: TimeZonesViewControllerInput?
    
    init(viewController: TimeZonesViewControllerInput?) {
        self.viewController = viewController
    }
    
    func prepareData(_ response: TimeZonesResponse.Response) {
        
        let timeZones = response.zones.map { responseTimeZone -> TimeZonesViewModel.Content.Zone in
            
            let zoneName = responseTimeZone.zoneName.split(separator: "/")
            let city = String(zoneName.last ?? "")
            let country = responseTimeZone.countryName
            let continent = String(zoneName.first ?? "")
            
            let timeZone = TimeZonesViewModel.Content.Zone(city: city, country: country, countryCode: responseTimeZone.countryCode, continent: continent, gmtOffset: responseTimeZone.gmtOffset, timestamp: responseTimeZone.timestamp)
            
            return timeZone
        }
        updateViewModel(with: timeZones)
    }
    
    func updateViewModel(with timeZones: [TimeZonesViewModel.Content.Zone]) {
        let viewModel = TimeZonesViewModel.Content(timeZones: timeZones)
        viewController?.viewModelUpdated(viewModel)
    }
}

extension TimeZonesPresenter: TimeZonesPresenterInput {
    func modelUpdated(with response: TimeZonesResponse.Response) {
        prepareData(response)
    }
}
