//
//  SmartRESTHelper.swift
//  WeatherApp
//
//  Created by Jerry Gordillo on 31/05/20.
//  Copyright © 2020 JerriodasCorp. All rights reserved.
//

import Foundation

class SmartRESTHelper {
    static func getWeatherData<ServiceResponse: Decodable> (url: String, completion: @escaping (ServiceResponse, NSError?) -> ()) {
        let url = URL(string: url)
        print("URL: \(url!)")
        
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                print("JSONResponse: \(String(data: data, encoding: .utf8)!)")
                let obj = try JSONDecoder().decode(ServiceResponse.self, from: data)
                completion(obj, err as NSError?)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
        }.resume()
    }
}
