//
//  ListCell.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 07.06.2022.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet var nameCityLabel: UILabel!
    @IBOutlet var conditionCityLabel: UILabel!
    @IBOutlet var tempCityLabel: UILabel!
    
    func configure(weather: Weather) {
        self.nameCityLabel.text = weather.name
        self.conditionCityLabel.text = weather.condition
        self.tempCityLabel.text = weather.tempString
    }
}
