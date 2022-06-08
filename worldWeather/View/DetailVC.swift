//
//  DetailVC.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 07.06.2022.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet var nameCityLabel: UILabel!
    @IBOutlet var viewCity: UIView!
    @IBOutlet var conditionLabel: UILabel!
    @IBOutlet var tempCityLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var feelsLikeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
