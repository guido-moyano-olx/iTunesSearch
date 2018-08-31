//
//  UIViewController+Extensions.swift
//  iTunesSearch
//
//  Created by Guido Moyano on 30/8/18.
//  Copyright © 2018 Guido Moyano. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showError(_ error:Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
