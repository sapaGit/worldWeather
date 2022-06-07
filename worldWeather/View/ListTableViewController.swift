//
//  ListTableViewController.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 06.06.2022.
//

import UIKit
import CoreLocation

class ListTableViewController: UITableViewController {

    let emptyCity = Weather()
    
    var citiesArray = [Weather]()
    
    let nameCitiesArray = ["Armavir", "Kavalersky", "Rostov-on-Don", "Krasnodar"]
    
    let nerworkWeatherManager = NetworkWeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        
        addCities()
    }
    
    func addCities() {
        getCityWeather(citiesArray: self.nameCitiesArray) { index, weather in
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCitiesArray[index]
            print(self.citiesArray)
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }

}
