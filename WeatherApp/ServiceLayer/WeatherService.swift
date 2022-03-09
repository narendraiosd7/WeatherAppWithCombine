//
//  WeatherService.swift
//  WeatherApp
//
//  Created by UW-IN-LPT0108 on 3/3/22.
//

import Foundation
import Combine

class WeatherService {
    
    func fetchWeatherFor(_ city: String) -> AnyPublisher<Weather, Error> {
        guard let url = URL(string: Constants.URLs.weatherFor(city)) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
