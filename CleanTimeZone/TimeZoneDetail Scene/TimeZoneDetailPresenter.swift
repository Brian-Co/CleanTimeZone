//
//  TimeZoneDetailPresenter.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

protocol TimeZoneDetailPresenterInput: class {
    func modelUpdated(with response: TimeZoneDetailResponse.Response)
}

final class TimeZoneDetailPresenter {
    
    typealias Response = TimeZoneDetailResponse.Response
    
    weak var viewController: TimeZoneDetailViewControllerInput?

    init(viewController: TimeZoneDetailViewControllerInput?) {
        self.viewController = viewController
    }
    
    func prepareData(for response: Response) {
        
        let zoneName = response.zoneName.split(separator: "/")
        let city = String(zoneName.last ?? "")
        let country = response.countryName
        let continent = String(zoneName.first ?? "")
        let date = formatDate(response.formatted)
        
        let text = city + ", " + country + "\r" + continent + "\r\r" + date
        
        let viewModel = TimeZoneDetailViewModel.Content(detailText: text)
        viewController?.viewModelUpdated(viewModel)
    }
    
    func formatDate(_ dateString: String) -> String {
     
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: dateString) else { return "Invalid Date" }
        
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale.init(identifier: "fr_FR")
        
        return dateFormatter.string(from: date)
    }
    
}

extension TimeZoneDetailPresenter: TimeZoneDetailPresenterInput {
    func modelUpdated(with response: Response) {
        prepareData(for: response)
    }
}
