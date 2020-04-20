//
//  WSRequest.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

enum WSRequest {
    
    enum TimeZonesRequest {
        case allTimeZones
        case paris
    }
    
    struct Methods {
        
        static func getData(from urlString: String, completion: @escaping (Data?) -> ()) {
            
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
        
        static func decode<T: Codable>(_ data: Data) -> T? {
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(T.self, from: data) else {
                return nil
            }
            return response
        }
        
    }
    
}

extension WSRequest.TimeZonesRequest {
    
    var url: String {
        switch self {
        case .allTimeZones:
            return "http://api.timezonedb.com/v2.1/list-time-zone?key=HEG8FEDU4DE3&format=json"
        case .paris:
            return "http://api.timezonedb.com/v2.1/get-time-zone?key=HEG8FEDU4DE3&format=json&by=zone&zone=Europe/Paris"
        }
    }
    
}
