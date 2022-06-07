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
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ListCell else { return UITableViewCell() }
       var weather = Weather()
    
        weather = citiesArray[indexPath.row]
        cell.configure(weather: weather)
        
        return cell
    }

}
