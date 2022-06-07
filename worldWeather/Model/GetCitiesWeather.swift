//
//  GetCitiesWeather.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 07.06.2022.
//

import Foundation
import CoreLocation

func getCoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        completion(placemark?.first?.location?.coordinate, error)
    }
}
