//
//  Weather.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 06.06.2022.
//

import Foundation

struct Weather {
    var name: String = "City"
    var icon: String
    var url: String
    var condition: String
    var pressureMm: Int
    var windSpeed: Double
    var temp: Int?
    var feelsLike: Int
    var humidity: Int
    
    init?(weatherData: WeatherData) {
        temp = weatherData.fact.temp
        icon = weatherData.fact.icon
        url = weatherData.info.url
        condition = weatherData.fact.condition
        pressureMm = weatherData.fact.pressureMm
        windSpeed = weatherData.fact.windSpeed
        feelsLike = weatherData.fact.feelsLike
        humidity = weatherData.fact.humidity
    }
}
