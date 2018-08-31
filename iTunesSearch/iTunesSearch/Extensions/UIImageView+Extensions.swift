//
//  UIImageView+Extensions.swift
//  iTunesSearch
//
//  Created by Guido Moyano Bertero on 27/8/18.
//  Copyright © 2018 Guido Moyano. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
