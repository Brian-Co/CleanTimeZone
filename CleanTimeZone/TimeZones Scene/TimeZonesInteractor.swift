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
        let url = "http://api.timezonedb.com/v2.1/list-time-zone?key=HEG8FEDU4DE3&format=json"
        getData(from: url) { [weak self] data in
            if let data = data,
                let response = self?.decode(data) {
                DispatchQueue.main.async {
                    self?.presenter?.modelUpdated(with: response)
                }
            }
        }
    }
    
    func getData(from urlString: String, completion: @escaping (Data?) -> ()) {
        
        guard let url = URL(string: urlString) else {
            return completion(nil)
        }
        
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error)
                return completion(nil)
            }
            
            guard let responseData = data else {
                return completion(nil)
            }

            return completion(responseData)
        }
        task.resume()
    }
    
    func decode(_ data: Data) -> TimeZonesResponse.Response? {
        let decoder = JSONDecoder()
        if let response = try? decoder.decode(TimeZonesResponse.Response.self, from: data) {
            return response
        } else {
            return nil
        }
    }
}

extension TimeZonesInteractor: TimeZonesInteractorInput {
    func loadContent() {
        requestTimeZones()
    }
}
