//
//  API.swift
//  iTunesSearch
//
//  Created by Guido Moyano Bertero on 25/8/18.
//  Copyright © 2018 Guido Moyano. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct API {
    static let baseUrl = "https://itunes.apple.com"
    
    struct Endpoints {
        static let search = "/search"
    }
    
    struct Parameters {
        static let term = "term"
        static let media = "media"
    }
}
