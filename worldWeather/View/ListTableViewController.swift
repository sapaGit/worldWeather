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
    var filteredCityArray = [Weather]()
    
    var nameCitiesArray = ["Moscow", "Kavalersky", "Rostov-on-Don", "Krasnodar"]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        addCities()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
//        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    @IBAction func pressAddButton(_ sender: UIBarButtonItem) {
        alertAddCity(name: "City", placeholder: "Type name of the city") { city in
            self.nameCitiesArray.append(city)
            self.citiesArray.append(self.emptyCity)
            self.addCities()
        }
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
    
        if isFiltering {
            return filteredCityArray.count
        }
        
        return citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ListCell else { return UITableViewCell() }
       var weather = Weather()
    
        if isFiltering {
            weather = filteredCityArray[indexPath.row]
        } else {
            weather = citiesArray[indexPath.row]
        }
        weather = citiesArray[indexPath.row]
        cell.configure(weather: weather)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            let editingRow = self.nameCitiesArray[indexPath.row]
            if let index = self.nameCitiesArray.firstIndex(of: editingRow) {
                if self.isFiltering {
                    self.filteredCityArray.remove(at: index)
                } else {
                self.citiesArray.remove(at: index)
                }
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            if isFiltering {
                let filter = filteredCityArray[indexPath.row]
                guard let destVC = segue.destination as? DetailVC else { return }
                destVC.weatherModel = filter
            } else {
            
            
            let cityWeather = citiesArray[indexPath.row]
            guard let destVC = segue.destination as? DetailVC else { return }
            destVC.weatherModel = cityWeather
            }
        }
    }
}

extension ListTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let search = searchController.searchBar.text else { return }
        filterContentForSearchText(search)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredCityArray = citiesArray.filter {
            $0.name.contains(searchText)
        }
        tableView.reloadData()
    }
}

