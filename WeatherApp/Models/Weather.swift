//
//  Weather.swift
//  WeatherApp
//
//  Created by UW-IN-LPT0108 on 3/3/22.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct 	Weather: Decodable {
    let temp: Double?
    let humidity: Double?
    
    static var placeholder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
}
