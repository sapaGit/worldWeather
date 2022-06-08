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
    }
    
    
    func refreshLabels() {
        nameCityLabel.text = weatherModel?.name
        
        guard let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(String(describing: weatherModel?.condition)).svg)") else { return }
        
        let weatherImage = UIView(SVGURL: url) { image in
            image.resizeToFit(self.viewCity.bounds)
        }
        self.viewCity.addSubview(weatherImage)
        
        conditionLabel.text = weatherModel?.condition
        tempCityLabel.text = weatherModel?.tempString
        pressureLabel.text = "\(String(describing: weatherModel?.pressureMm))"
        windSpeedLabel.text = "\(String(describing: weatherModel?.windSpeed))"
        humidityLabel.text = "\(String(describing: weatherModel?.humidity))"
        feelsLikeLabel.text = "\(String(describing: weatherModel?.feelsLike))"
    }
}
