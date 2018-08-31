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


enum APIRouter: URLRequestConvertible {
    
    case search(term:String, mediaType:String)
    
    private var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .search:
            return API.Endpoints.search
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .search(let term, let mediaType):
            return [API.Parameters.term: term, API.Parameters.media: mediaType]
        }
    }
    
    private var encoding: ParameterEncoding {
        switch self.method {
        case .post:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try API.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}

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



