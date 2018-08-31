//
//  APIClient.swift
//  iTunesSearch
//
//  Created by Guido Moyano on 30/8/18.
//  Copyright © 2018 Guido Moyano. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    
    static func search(term:String, mediaType:String, completion: @escaping ([MediaContent], Error?) -> Void) {
        Alamofire.request(APIRouter.search(term: term, mediaType: mediaType)).responseJSON { (response) in
            
            if let error = response.error {
                completion([], error)
            }
            else {
                let json = JSON(response.result.value!)
                var mediaContents = [MediaContent]()
                
                if let contentJson = json["results"].array {
                    for content in contentJson {
                        let mediaContent = MediaContent(JSON: content)
                        mediaContents.append(mediaContent)
                    }
                }
                
                completion(mediaContents, nil)
            }
            
        }
    }
    
}

