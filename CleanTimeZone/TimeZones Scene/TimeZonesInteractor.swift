//
//  TimeZonesInteractor.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 17/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

protocol TimeZonesInteractorInput: class {
    func loadContent()
}

final class TimeZonesInteractor {
    var presenter: TimeZonesPresenterInput?

    init(presenter: TimeZonesPresenterInput?) {
        self.presenter = presenter
    }
    
    func requestTimeZones() {
        let url = WSRequest.TimeZonesRequest.allTimeZones.url
        
        WSRequest.Methods.getData(from: url) { [weak self] data in
            if let data = data,
                let response: TimeZonesResponse.Response = WSRequest.Methods.decode(data) {
                DispatchQueue.main.async {
                    self?.presenter?.modelUpdated(with: response)
                }
            }
        }
    }
}

extension TimeZonesInteractor: TimeZonesInteractorInput {
    func loadContent() {
        requestTimeZones()
    }
}
