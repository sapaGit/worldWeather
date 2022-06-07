//
//  WeatherData.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 06.06.2022.
//

import Foundation

struct WeatherData: Decodable {
    let info: Info
    let fact: Fact
}
struct Info: Decodable {
    let url: String
}

struct Fact: Decodable {
    let temp: Int?
    let icon: String
    let condition: String
    let windSpeed: Double
    let pressureMm: Int
    let feelsLike: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case icon
        case condition
        case windSpeed = "wind_speed"
        case pressureMm = "pressure_mm"
        case feelsLike = "feels_like"
        case humidity
    }
}

