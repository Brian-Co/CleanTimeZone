//
//  TimeZoneDetailInteractor.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

protocol TimeZoneDetailInteractorInput: class {
    func loadContent(_ apiLink: String?)
}

final class TimeZoneDetailInteractor {
    var presenter: TimeZoneDetailPresenterInput?
    
    init(presenter: TimeZoneDetailPresenterInput?) {
        self.presenter = presenter
    }
    
}

extension TimeZoneDetailInteractor: TimeZoneDetailInteractorInput {
    func loadContent(_ apiLink: String?) {
        guard let link = apiLink else { return }
        let url = WSRequest.TimeZonesRequest.timeZoneDetail.url + link
        
        WSRequest.Methods.getData(from: url) { [weak self] data in
            if let data = data,
                let response: TimeZoneDetailResponse.Response = WSRequest.Methods.decode(data) {
                DispatchQueue.main.async {
                    self?.presenter?.modelUpdated(with: response)
                }
            }
        }
    }
}
