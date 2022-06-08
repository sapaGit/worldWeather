//
//  DetailVC.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 07.06.2022.
//

import UIKit
import SwiftSVG

class DetailVC: UIViewController {

    @IBOutlet var nameCityLabel: UILabel!
    @IBOutlet var viewCity: UIView!
    @IBOutlet var conditionLabel: UILabel!
    @IBOutlet var tempCityLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    
    
    var weatherModel: Weather?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshLabels()
    }
    
    
    func refreshLabels() {
        if let nameCity = weatherModel?.name {
            nameCityLabel.text = nameCity
        }
        
        if let icon = weatherModel?.icon {
            if let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(icon).svg") {
                let weatherImage = UIView(SVGURL: url) { (image) in
                    image.resizeToFit(self.viewCity.bounds)
                }

                self.viewCity.addSubview(weatherImage)
            }
        }

        if let condition = weatherModel?.condition { conditionLabel.text = condition }
        if let temp = weatherModel?.temp { tempCityLabel.text = String(temp) }
        if let pressure = weatherModel?.pressureMm { pressureLabel.text = String(pressure) }
        if let windSpeed = weatherModel?.windSpeed { windSpeedLabel.text = String(windSpeed) }
        if let humidity = weatherModel?.humidity { humidityLabel.text = String(humidity) }
        if let feelsLike = weatherModel?.feelsLike { feelsLikeLabel.text = String(feelsLike) }
        
    }
}
