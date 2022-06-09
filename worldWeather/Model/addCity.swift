//
//  addCity.swift
//  worldWeather
//
//  Created by Sergey Pavlov on 09.06.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func alertAddCity(name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "Ok", style: .default) { action in
            let tftext = alertController.textFields?.first
            guard let text = tftext?.text else { return }
            completionHandler(text)
        }
        
        alertController.addTextField { tf in
            tf.placeholder = placeholder
        }
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(alertOkAction)
        alertController.addAction(alertCancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
