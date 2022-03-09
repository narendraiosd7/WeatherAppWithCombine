//
//  Constants.swift
//  WeatherApp
//
//  Created by UW-IN-LPT0108 on 3/3/22.
//

import Foundation

struct Constants {
    struct URLs {
        static func weatherFor(_ city: String) -> String {
            return "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=67a92c5807b2e014fb95822dd55cc295&units=imperial"
        }
        
        //Units: -
        //℃ = metric
        //℉ = imperial
    }
}
