//
//  Weather.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 06.06.2022.
//

import Foundation

struct Weather {
    var name: String = "City"
    var icon: String = ""
    var url: String = ""
    var condition: String = ""
    var pressureMm: Int = 0
    var windSpeed: Double = 0
    var temp: Int = 0
    var feelsLike: Int = 0
    var humidity: Int = 0
    
    init?(weatherData: WeatherData) {
        if let tempValue = weatherData.fact.temp { temp = tempValue } else { temp = 0 }
        icon = weatherData.fact.icon
        url = weatherData.info.url
        condition = weatherData.fact.condition
        pressureMm = weatherData.fact.pressureMm
        windSpeed = weatherData.fact.windSpeed
        feelsLike = weatherData.fact.feelsLike
        humidity = weatherData.fact.humidity
    }
    
    init() {
    }
}
