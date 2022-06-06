//
//  Weather.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 06.06.2022.
//

import Foundation

struct Weather {
    var name: String = "City"
    var tempAvg: Int?
    var icon: String
    var url: String
    var condition: String
    var pressureMm: Int
    var windSpeed: Double
    var tempMin: Int?
    var tempMax: Int?
    
    init?(weatherData: WeatherData) {
        tempAvg = weatherData.fact.tempAvg
        icon = weatherData.fact.icon
        url = weatherData.info.url
        condition = weatherData.fact.condition
        pressureMm = weatherData.fact.pressureMm
        windSpeed = weatherData.fact.windSpeed
        tempMin = weatherData.fact.tempMin
        tempMax = weatherData.fact.tempMax
    }
}
