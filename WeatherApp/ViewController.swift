//
//  ViewController.swift
//  WeatherApp
//
//  Created by UW-IN-LPT0108 on 3/3/22.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    private var weatherService: WeatherService = WeatherService()
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPublishers()
//        self.cancellable = self.weatherService.fetchWeather(city: "Hyderabad")
//            .catch { _ in
//                Just(Weather.placeholder)
//            }
//            .map { weather in
//                if let temp = weather.temp {
//                    return "\(temp) ℉"
//                } else {
//                    return "Error getting weather"
//                }
//            }
//            .assign(to: \.text, on: self.tempLabel)
        
    }
    
    private func setupPublishers() {
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: cityTextField)
        
        cancellable = publisher.compactMap {
            ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        }.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .flatMap { city in
                return self.weatherService.fetchWeatherFor(city)
                    .catch { _ in
                        Just(Weather.placeholder)
                    }
                    .map { $0 }
                
            }
            .sink {
                if let temp = $0.temp {
                    self.tempLabel.text = "\(temp) ℉"
                } else {
                    self.tempLabel.text = ""
                }
            }
    }


}

