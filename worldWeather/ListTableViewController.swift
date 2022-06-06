//
//  ListTableViewController.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 06.06.2022.
//

import UIKit

class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func fetchWeather() {
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=<47.222096>&lon=<39.718444>"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("38f639cd-1682-4d7a-be6f-6a0e46586071", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "Get"
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
